# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools

MY_PN="gpstk"
MY_P="${MY_PN}${PV}"
DESCRIPTION="GNU charset conversion library for libc which doesn't implement it"
HOMEPAGE="http://www.gpstk.org/"
SRC_BASE="mirror://sourceforge/${MY_PN}"
SRC_URI="x86? ( ${SRC_BASE}/${MY_PN}${PV}.linux.386.tar.gz )
         amd64? ( ${SRC_BASE}/${MY_PN}${PV}.linux.x86_64.tar.gz )"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( app-doc/doxygen )"

src_install() {
        declare GPSTK_HOME=/opt

	dodir ${GPSTK_HOME} || die "Creating directoy failed."
        cp -R ${MY_P}/ "${D}"${GPSTK_HOME} || die "Unable to install gpstk-linux folder"

	dodir /opt/bin || die "Creating directory failed."
	for file in $(ls ./"${MY_P}/bin") ; do 
		dosym "${D}"${GPSTK_HOME}/${MY_P}/bin/${file} /opt/bin/${file};
	done

	if use doc; then
		doxygen
	fi
}
