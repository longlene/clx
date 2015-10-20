# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="suckless init"
HOMEPAGE="http://git.2f30.org/sinit/"
SRC_URI="http://git.2f30.org/sinit/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s/VERSION/${PV}/" ${PN}.8
}

src_install() {
	dosbin sinit
	doman ${PN}.8
}
