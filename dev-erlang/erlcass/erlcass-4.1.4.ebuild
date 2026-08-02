# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

CPP_DRIVER_COMMIT="debe67edcc703882bccab17bd0d4d426cd01c675"

DESCRIPTION="High-Performance Erlang Cassandra driver based on DataStax cpp-driver"
HOMEPAGE="https://github.com/silviucpp/erlcass"
SRC_URI="
	https://github.com/silviucpp/erlcass/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/silviucpp/cassandra-cpp-driver/archive/${CPP_DRIVER_COMMIT}.tar.gz
		-> erlcass-cpp-driver-${CPP_DRIVER_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"
DEPEND="
	dev-libs/libuv:=
	dev-libs/openssl:=
	virtual/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	rebar3_src_prepare

	# Pre-populate the cpp-driver fork so build_deps.sh is not needed
	mkdir -p "${S}/_build/deps/cpp-driver" || die
	cp -r "${WORKDIR}/cassandra-cpp-driver-${CPP_DRIVER_COMMIT}/." \
		"${S}/_build/deps/cpp-driver/" || die

	# Remove the network-fetch step; cmake build is done in src_compile
	sed -i 's|@./build_deps.sh \$(CPP_DRIVER_REV)||' "${S}/Makefile" || die

	# Remove rebar3_hex project plugin — not needed for build, causes network fetch
	sed -i 's|{project_plugins, \[rebar3_hex\]}\.||' "${S}/rebar.config" || die

	# Pre-generate c_src/env.mk: nif.mk uses -s init stop before -eval which
	# stops the VM before the eval runs on OTP 27+
	local erts_include ei_include ei_lib
	erts_include=$(erl -noshell -eval \
		'io:format("~s",[filename:join([code:root_dir(),"erts-"++erlang:system_info(version),"include"])]),halt().' \
		2>/dev/null) || die
	ei_include=$(erl -noshell -eval \
		'io:format("~s",[code:lib_dir(erl_interface,include)]),halt().' \
		2>/dev/null) || die
	ei_lib=$(erl -noshell -eval \
		'io:format("~s",[code:lib_dir(erl_interface,lib)]),halt().' \
		2>/dev/null) || die
	printf 'ERTS_INCLUDE_DIR ?= %s\nERL_INTERFACE_INCLUDE_DIR ?= %s\nERL_INTERFACE_LIB_DIR ?= %s\n' \
		"${erts_include}" "${ei_include}" "${ei_lib}" > "${S}/c_src/env.mk" || die
}

src_compile() {
	# Build the static cpp-driver library
	local driver_build="${S}/_build/deps/cpp-driver/build"
	mkdir -p "${driver_build}" || die
	pushd "${driver_build}" || die
	CFLAGS="-fPIC -Wno-class-memaccess" \
	CXXFLAGS="-fPIC -Wno-class-memaccess" \
	cmake .. \
		-DCASS_BUILD_STATIC=ON \
		-DCMAKE_BUILD_TYPE=RELEASE || die
	emake || die
	popd || die

	# rebar3 compile triggers the pre_hook → make nif_compile → make -C c_src
	rebar3_src_compile
}

src_install() {
	rebar3_src_install

	local dest="$(get_erl_libs)/${P}"
	# priv/ in _build is a symlink — install NIF manually
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
	# include/ in _build is a symlink — install headers manually
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
