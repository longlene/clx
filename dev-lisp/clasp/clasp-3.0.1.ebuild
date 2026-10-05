# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( {17..20} 22 )

inherit check-reqs edo flag-o-matic llvm-r2 multiprocessing ninja-utils toolchain-funcs

DESCRIPTION="Common Lisp implementation based on LLVM with C++ interoperation"
HOMEPAGE="https://github.com/clasp-developers/clasp"
# Release tarball bundles all repos.sexp dependencies (koga --skip-sync)
SRC_URI="https://github.com/clasp-developers/clasp/releases/download/${PV}/${P}.tar.gz"

# Clasp core and ECL-derived src/lisp/kernel/{lsp,clos} are LGPL-2+,
# parts are MIT, CMU-derived pprint/format are public domain,
# bundled bdwgc is boehm-gc, Lisp contribs are MIT/BSD-style
LICENSE="LGPL-2+ BSD MIT boehm-gc public-domain"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="+native"

RDEPEND="
	sys-devel/binutils:*
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}=
		llvm-core/llvm:${LLVM_SLOT}=
		llvm-core/lld:${LLVM_SLOT}
	')
	dev-libs/boost:=
	>=dev-libs/libfmt-7.1.0:=
	>=dev-libs/gmp-6.0.0:=[cxx]
	virtual/libelf:=
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-alternatives/ninja
	dev-lisp/sbcl
	virtual/pkgconfig
"

# Clasp's snapshots and stackmaps need unstripped binaries
RESTRICT="strip"

CHECKREQS_DISK_BUILD="8G"
CHECKREQS_MEMORY="4G"

pkg_pretend() {
	check-reqs_pkg_pretend
}

pkg_setup() {
	check-reqs_pkg_setup
	llvm-r2_pkg_setup
}

src_configure() {
	# koga drives clang from the selected LLVM slot
	local -x CC="${CHOST}-clang-${LLVM_SLOT}" CXX="${CHOST}-clang++-${LLVM_SLOT}"
	strip-unsupported-flags
	filter-ldflags -s -Wl,-s

	local myconf=(
		--llvm-config="$(get_llvm_prefix -d)/bin/llvm-config"
		--cflags="${CFLAGS}"
		--cxxflags="${CXXFLAGS}"
		--ldflags="${LDFLAGS}"
		--jobs=$(makeopts_jobs)
		--reproducible-build
		--skip-sync
		--build-path="${S}/build/"
		--bin-path="${EPREFIX}/usr/bin/"
		--lib-path="${EPREFIX}/usr/$(get_libdir)/clasp/"
		--dylib-path="${EPREFIX}/usr/$(get_libdir)/"
		--share-path="${EPREFIX}/usr/share/clasp/"
		--pkgconfig-path="${EPREFIX}/usr/$(get_libdir)/pkgconfig/"
		# koga bakes the install root into build.ninja at configure time
		--package-path="${D}"
		--pkg-config="$(tc-getPKG_CONFIG)"
		--objcopy="$(tc-getOBJCOPY)"
		--ld=lld
		--lisp=sbcl
		--build-mode=$(usex native native bytecode)
	)

	export CLASP_BUILD_JOBS=$(makeopts_jobs)
	edo ./koga "${myconf[@]}"
}

src_compile() {
	eninja -C build
}

src_test() {
	edo build/boehmprecise/clasp --norc --non-interactive \
		--eval '(ext:quit (if (eql (* 6 7) 42) 0 1))'
}

src_install() {
	eninja -C build install
	einstalldocs
	dodoc RELEASE_NOTES.md
	dodoc -r licenses
	doman docs/clasp.1
}
