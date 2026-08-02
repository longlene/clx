# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="High-performance connection pool for Erlang"
HOMEPAGE="https://github.com/saleyn/arterial"
COMMIT="9e85ecab439e204230777ce8c160f9677b794af0"
NIFPP_COMMIT="fab40a159db4c6900164ff05aafb22d612751405"

SRC_URI="
	https://github.com/saleyn/arterial/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/saleyn/nifpp/archive/${NIFPP_COMMIT}.tar.gz -> nifpp-${NIFPP_COMMIT}.gh.tar.gz
"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/etran
	dev-erlang/util
"

src_prepare() {
	rebar3_src_prepare
	cp "${WORKDIR}/nifpp-${NIFPP_COMMIT}/enif.hpp" "${S}/c_src/enif.hpp" || die
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/arterial.so
}
