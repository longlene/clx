# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="simple dhcp"
HOMEPAGE="http://git.2f30.org/sdhcp/"
SRC_URI="http://git.2f30.org/sdhcp/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/PREFIX/ s#/local##' \
		-e '/= gcc/ s|#||' \
		config.mk
}
