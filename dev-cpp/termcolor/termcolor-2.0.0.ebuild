# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Termcolor is a header-only C++ library for printing colored messages to the terminal"
HOMEPAGE="https://github.com/ikalnytskyi/termcolor"
SRC_URI="https://github.com/ikalnytskyi/termcolor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

