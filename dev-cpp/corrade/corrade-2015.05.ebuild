# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

MY_PV=${PV/./-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="C++11/C++14 multiplatform utility library"
HOMEPAGE="http://mosra.cz/blog/corrade.php"
SRC_URI="https://github.com/mosra/corrade/archive/snapshot-${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-snapshot-${MY_PV}
