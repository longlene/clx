# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="AMD XvBA SDK"
HOMEPAGE="http://developer.amd.com/ZONES/OPENSOURCE/Pages/default.aspx"
BASE_URI="http://developer.amd.com/Downloads"
SRC_URI="${BASE_URI}/${P/_p*}-${PV/*_p}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-drivers/ati-drivers"
RDEPEND="${DEPEND}"

src_install() {
	local VER_FORMAT="${PV/_p*}"
	dodoc "doc/AMD_XvBA_Spec_v${VER_FORMAT/./_}_01_AES_2.pdf"

	insinto "/usr/include/"
	doins "include/amdxvba.h"
}
