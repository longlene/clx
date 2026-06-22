# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="ETS Table Manager"
HOMEPAGE="https://fredyouhanaie.github.io/etsmgr"
SRC_URI="https://github.com/fredyouhanaie/etsmgr/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
