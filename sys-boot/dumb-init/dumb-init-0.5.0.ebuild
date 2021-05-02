# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="A minimal init system for Linux containers"
HOMEPAGE="https://github.com/Yelp/dumb-init"
SRC_URI="https://github.com/Yelp/dumb-init/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin dumb-init
	dodoc README.md
}
