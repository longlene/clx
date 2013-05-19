# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2

DESCRIPTION="Placeholder package, dev-java/jaxb now includes tools"
HOMEPAGE="http://jaxb.dev.java.net/"
SRC_URI="https://jaxb.dev.java.net/2.1.10/JAXB2_20090206.jar
		https://jaxb.dev.java.net/2.1.10/jaxb-ri-2_1_10.src.zip"

LICENSE="CDDL"
SLOT="2"
KEYWORDS="~amd64 ~x86 ~ppc ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-java/jaxb-tools-${PV}"

pkg_setup() {
	elog ""
	elog "The package dev-java/jaxb now includes the tools"
	elog "which were installed separately in jaxb-tools before."
	elog "You may remove this package if you want to."
	elog ""
}

src_install() {
	# Can't use JAVA_PKG_SHAREPATH as java-pkg_init_paths_ is internal
	[[ ${DESTTREE} ]] || die "DESTTREE not set"
	dosym jaxb-${SLOT} "${DESTTREE}/share/${PN}-${SLOT}"
}
