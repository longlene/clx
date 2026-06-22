# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/lager.app.src"

DESCRIPTION="Lager drop-in replacement on top of logger"
HOMEPAGE="https://github.com/g-andrade/fake_lager"
SRC_URI="https://github.com/g-andrade/fake_lager/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	rebar3_install_lib "_build/${REBAR_PROFILE}/lib/lager"
	einstalldocs
}
