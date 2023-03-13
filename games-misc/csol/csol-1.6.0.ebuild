# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A small collection of solitaire/patience games"
HOMEPAGE="https://nielssp.dk/csol/"
SRC_URI="https://github.com/nielssp/csol/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_MAKEFILE_GENERATOR=emake
