# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PV=${PV/_/-}

DESCRIPTION="Open PacKaGe Management"
HOMEPAGE="https://code.google.com/p/opkg/"
SRC_URI="http://downloads.yoctoproject.org/releases/opkg/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-${MY_PV}
