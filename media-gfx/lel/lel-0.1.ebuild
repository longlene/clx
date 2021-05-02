# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="suckless imagefile viewer"
HOMEPAGE="http://git.2f30.org/lel/"
SRC_URI="http://git.2f30.org/lel/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX =/ s#/local##' config.mk
}
