# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit vcs-snapshot qmake-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/Shinmera/libcommonqt/archive/qt-libs${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	kde-base/smokeqt
"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake4 commonqt.pro
	emake
}
