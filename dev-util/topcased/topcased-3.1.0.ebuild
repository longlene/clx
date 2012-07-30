# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Eclipse-based toolkit dedicated to critical and embedded systems, softwares and hardwares."
HOMEPAGE="http://www.topcased.org"
SRC_URI="http://gforge.enseeiht.fr/frs/download.php/2427/Topcased-RCP-linux-${PV}.tar.gz"

EAPI="2"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dodir /opt/"${P}"
	cp -R "${WORKDIR}/Topcased-${PV}/"* "${D}/opt/${P}/" || die "Install failed!"
	dosym "/opt/${P}/eclipse" "/opt/bin/topcased" || die "Can't create Symlink!"
}

