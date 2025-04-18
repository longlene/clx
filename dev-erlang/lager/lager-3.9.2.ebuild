# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Logging framework for Erlang/OTP"
HOMEPAGE="https://github.com/erlang-lager/lager"
SRC_URI="https://github.com/erlang-lager/${PN}/archive/${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm ~ia64 ppc ~sparc x86"

DEPEND=">=dev-erlang/goldrush-0.1.9
	>=dev-lang/erlang-17.1"
RDEPEND="${DEPEND}"

DOCS=( README.md TODO )

src_prepare() {
	default
	rebar_src_prepare
	sed -i '/goldrush/d' rebar.config.script
	# 'priv' directory contains only edoc.css, but doc isn't going to be built.
	rm -r "${S}/priv" || die
}
