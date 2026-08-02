# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/leo_mcerl.app.src"

inherit rebar

LIBCUTIL_PV="0.5.1"

DESCRIPTION="Memory cache library for Erlang with an LRU C NIF"
HOMEPAGE="https://github.com/leo-project/leo_mcerl"
SRC_URI="
	https://github.com/leo-project/leo_mcerl/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/leo-project/libcutil/archive/refs/tags/${LIBCUTIL_PV}.tar.gz
		-> libcutil-${LIBCUTIL_PV}.gh.tar.gz
"
S="${WORKDIR}/leo_mcerl-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"

src_prepare() {
	rebar_src_prepare

	# rebar3-only port_compiler plugin config; rebar2 compiles
	# port_specs natively. The build_deps.sh hooks git-clone and
	# cmake-build libcutil — replaced by SRC_URI + src_compile, and
	# rebar exports port_env (with the yet-unbuilt libcutil.a in
	# LDFLAGS) to hooks, breaking cmake's compiler check.
	sed -i \
		-e '/^{plugins, \[pc\]}\./d' \
		-e '/^{provider_hooks/,/^\]}\./d' \
		-e '/^{pre_hooks/,/^\]}\./d' \
		-e '/^{post_hooks/,/^\]}\./d' \
		-e 's/warnings_as_errors,\?//' \
		rebar.config || die

	mv "${WORKDIR}/libcutil-${LIBCUTIL_PV}" c_src/libcutil || die

	# tests need dev-libs/check and are added unconditionally
	sed -i '/ADD_SUBDIRECTORY(tests)/d' c_src/libcutil/CMakeLists.txt || die
}

src_compile() {
	# build bundled libcutil first; rebar's port_env links it statically
	mkdir c_src/libcutil/build || die
	pushd c_src/libcutil/build >/dev/null || die
	cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DBUILD_TESTING=OFF .. || die
	emake
	popd >/dev/null || die

	rebar_src_compile
}
