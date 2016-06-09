# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="C++ coroutine library"
HOMEPAGE="https://github.com/yyzybb537/libgo"
SRC_URI="https://github.com/yyzybb537/libgo/archive/v${PV}-stable.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}-stable

src_prepare() {
	sed -i '/install/{/etc/d}' CMakeLists.txt
}
