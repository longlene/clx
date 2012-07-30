# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=4

inherit eutils

DESCRIPTION="HardInfo is a system information and benchmark tool for Linux systems"
HOMEPAGE="http://hardinfo.berlios.de/"
SRC_URI="http://download.berlios.de/hardinfo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.6
	>=net-libs/libsoup-2.2.100"
RDEPEND="${DEPEND}"
