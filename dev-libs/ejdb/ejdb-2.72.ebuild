# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Embeddable JSON Database engine"
HOMEPAGE="http://ejdb.org"
SRC_URI="https://github.com/Softmotions/ejdb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DPACKAGE_TGZ=OFF
	-DPACKAGE_ZIP=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	doman doc/man/libejdb.3
}
