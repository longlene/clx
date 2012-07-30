# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A utility that collects device vital product data (vpd) and displays it using several ouput programs."
HOMEPAGE="http://linux-diag.sourceforge.net/Lsvpd.html"
SRC_URI="mirror://sourceforge/linux-diag/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~ppc64"
IUSE=""

DEPEND="sys-apps/sg3_utils
	>=sys-libs/libvpd-1.5.0"
RDEPEND=">=sys-libs/libstdc++-v3-3.3.4
	>=sys-libs/zlib-1.2.3
	>=sys-fs/udev-103
	ppc? ( >=sys-libs/librtas-1.3.0 )
	ppc64? ( >=sys-libs/librtas-1.3.0 )"

pkg_postinst()
{
	elog "This package contains a program that, when called at each boot,"
	elog "will keep the vpd database up to date.  If this is functionality"
	elog "that you desire please add the vpdupdater script (found in"
	elog "/etc/init.d/) to the default run level."
}
