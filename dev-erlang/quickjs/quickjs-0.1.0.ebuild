# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

QUICKJS_NG_COMMIT="c707cf5eda67a97bbff7a60cb2ef124fd4a77420"

DESCRIPTION="QuickJS JavaScript engine for Erlang (powered by quickjs-ng)"
HOMEPAGE="https://github.com/benoitc/erlang-quickjs"
SRC_URI="
	https://github.com/benoitc/erlang-quickjs/archive/refs/tags/${PV}.tar.gz
		-> erlang-${P}.tar.gz
	https://github.com/quickjs-ng/quickjs/archive/${QUICKJS_NG_COMMIT}.tar.gz
		-> quickjs-ng-${QUICKJS_NG_COMMIT}.tar.gz
"
S="${WORKDIR}/erlang-${P}"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"

src_prepare() {
	rebar3_src_prepare

	# Populate the git submodule directory from the separately-fetched tarball.
	# The pre_hook "git submodule update" is removed by the sed below.
	cp -r "${WORKDIR}/quickjs-${QUICKJS_NG_COMMIT}/." "${S}/c_src/quickjs-ng/" || die

	# Remove the git-submodule pre_hook; the directory is already populated.
	sed -i 's|{compile, "git submodule update --init --recursive c_src/quickjs-ng"},||' \
		rebar.config || die
}

src_install() {
	rebar3_src_install
	# rebar3_install_lib skips symlinked dirs — install priv/ (NIF) manually.
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
}
