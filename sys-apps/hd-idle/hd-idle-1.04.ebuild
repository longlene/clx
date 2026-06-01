# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

SRC_URI="mirror://sourceforge/hd-idle/${P}.tgz"

SLOT="0"
S=${WORKDIR}/${PN}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
