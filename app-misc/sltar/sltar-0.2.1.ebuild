# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="a simple tar implementation"
HOMEPAGE="http://git.suckless.org/sltar/"
SRC_URI="http://git.suckless.org/sltar/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX =/ s#/local##' config.mk
}
