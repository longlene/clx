# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="suckless linux base utils"
HOMEPAGE="http://git.2f30.org/ubase/"
SRC_URI="http://git.2f30.org/ubase/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/CC = gcc/ s|#||' \
		-e '/PREFIX =/ s#/local##' \
		-e '/LDFLAGS/ s|-s||' \
		config.mk
}
