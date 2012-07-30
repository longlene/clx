# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

MY_PV=$(replace_version_separator 2 '-')

DESCRIPTION="Sound visualisation gadget that works directly with ALSA"
HOMEPAGE="http://www.aufroof.org/?expand=marcel&detail=04_projekte"
SRC_URI="http://www.aufroof.org/marcel/04_projekte/${PN}-${MY_PV}.tar.gz"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

src_compile() {
 cd ${WORKDIR}/${PN}-${MY_PV}
 econf
 emake
}

src_install() {
 cd ${WORKDIR}/${PN}-${MY_PV}
 einstall
}
