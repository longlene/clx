# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="XSL Stylesheets for docbook2odf"
HOMEPAGE="http://open.comsultia.com/docbook2odf/"
ESVN_REPO_URI="http://svn.comsultia.com/docbook2odf/trunk/xsl"
ESVN_PROJECT="docbook2odf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ppc sparc amd64"
IUSE=""

RDEPEND="!app-text/docbook2odf-xsl-stylesheets"

src_unpack() {
	subversion_src_unpack
}

src_install() {
	WORKDIR=${WORKDIR}/docbook2odf-xsl-stylesheets-svn-${PV}
	DEST="/usr/share/docbook2odf/xsl"

	insinto ${DEST}
	doins ${WORKDIR}/*

	dodir ${DEST}/document-content
	insinto ${DEST}/document-content
	doins ${WORKDIR}/document-content/*

	dodir ${DEST}/document-styles
	insinto ${DEST}/document-styles
	doins ${WORKDIR}/document-styles/*

	dodir ${DEST}/overlay
	insinto ${DEST}/overlay
	doins ${WORKDIR}/overlay/*
	
	dodir ${DEST}/common
	insinto ${DEST}/common
	doins ${WORKDIR}/common/*

}