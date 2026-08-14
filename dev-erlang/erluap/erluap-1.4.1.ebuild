# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

UAP_CPP_COMMIT="bc4494ccd1a7ff474d13b5c3e3cf37a6d2c72f52"
UAP_CORE_COMMIT="f87f3a9aea3916399d70e5cb2c2aedea5008d881"

DESCRIPTION="Erlang implementation of ua-parser based on uap-cpp"
HOMEPAGE="https://github.com/silviucpp/erluap"
SRC_URI="
	https://github.com/silviucpp/erluap/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ua-parser/uap-cpp/archive/${UAP_CPP_COMMIT}.tar.gz -> uap-cpp-${UAP_CPP_COMMIT}.gh.tar.gz
	https://github.com/ua-parser/uap-core/archive/${UAP_CORE_COMMIT}.tar.gz -> uap-core-${UAP_CORE_COMMIT}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-cpp/yaml-cpp:=
	dev-libs/re2:=
"
DEPEND="${RDEPEND}"
BDEPEND="dev-build/cmake"

src_prepare() {
	rebar3_src_prepare

	# build_deps.sh git-clones+builds uap-cpp and git-clones uap-core over
	# the network at compile time (triggered by the rebar.config pre_hook);
	# pre-populate its expected output from the pinned snapshots fetched via
	# SRC_URI instead, so it short-circuits its own "already present" check
	# and never reaches the network
	mkdir -p _build/deps || die
	cp -r "${WORKDIR}/uap-cpp-${UAP_CPP_COMMIT}" _build/deps/uap-cpp || die
	cp -r "${WORKDIR}/uap-core-${UAP_CORE_COMMIT}" _build/deps/uap-core || die

	pushd _build/deps/uap-cpp >/dev/null || die
	mkdir build || die
	cd build || die
	cmake -DBUILD_SHARED=OFF -DBUILD_STATIC=ON -DBUILD_BENCHMARKS=OFF \
		-DBUILD_TESTS=OFF .. || die
	emake uap-cpp-static
	popd >/dev/null || die

	mkdir -p priv || die
	cp _build/deps/uap-core/regexes.yaml priv/regexes.yaml || die

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
		"${erts_include}" "${ei_include}" "${ei_lib}" > c_src/env.mk || die
}
