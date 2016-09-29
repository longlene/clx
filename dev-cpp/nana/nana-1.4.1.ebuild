# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="a modern C++ GUI library"
HOMEPAGE="http://nanapro.org"
SRC_URI="https://github.com/cnjinhao/nana/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/libpng
"
RDEPEND="${DEPEND}"
