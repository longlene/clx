# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11} )
inherit python-single-r1

DESCRIPTION="Emscripten is a complete compiler toolchain to WebAssembly, using LLVM"
HOMEPAGE="https://emscripten.org"
SRC_URI="https://github.com/emscripten-core/emscripten/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="network-sandbox test"
MY_LLVM_VERSION=16

RDEPEND="
	dev-util/binaryen
	net-libs/nodejs
	sys-devel/clang:${MY_LLVM_VERSION}[llvm_targets_WebAssembly]
	>=sys-devel/lld-${MY_LLVM_VERSION}
	virtual/jre
"
BDEPEND="
	net-libs/nodejs
"

PATCHES=(
	"${FILESDIR}"/emscripten-2.0.8-wasm-ld.patch
	"${FILESDIR}"/emscripten-3.1.28-py-runner.patch
)

src_prepare() {
	default
	npm ci || die
	sed -e "s|GENTOO_PREFIX|${EPREFIX}|" -e "s|GENTOO_LIB|$(get_libdir)|" -e "s|GENTOO_LLVM_VERSION|${MY_LLVM_VERSION}|" < "${FILESDIR}/config" > .emscripten || die
	sed -i -e "s|GENTOO_PREFIX|${EPREFIX}|" -e "s|GENTOO_LIB|$(get_libdir)|" -e "s|GENTOO_PYTHON|${EPYTHON}|" tools/shared.py tools/run_python.sh tools/run_python_compiler.sh || die
}

src_compile() {
	:
}

src_install() {
	dodir /usr/bin
	tools/create_entry_points.py || die
	insinto "/usr/$(get_libdir)/emscripten"
	doins -r .
	chmod +x "${ED}/usr/$(get_libdir)/emscripten/tools"/* || die
	chmod +x "${ED}/usr/$(get_libdir)/emscripten"/* || die
	chmod +x "${ED}/usr/bin"/* || die
}
