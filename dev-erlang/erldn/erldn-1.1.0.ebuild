# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An EDN parser for BEAM languages"
HOMEPAGE="https://github.com/erlsci/erldn"
SRC_URI="https://github.com/erlsci/erldn/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
