# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="minimalistic commandline hexadecimal editor similar to radare"
HOMEPAGE="https://github.com/radare/ired"
SRC_URI="https://github.com/radare/ired/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PATH/d' vired
}

src_install() {
	dobin ired bdiff vired
	doman ired.1 vired.1
}
