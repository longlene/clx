# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

HOMEPAGE="http://www.docbook.org/xml/mathml/1.1CR1/"
SRC_URI="http://www.docbook.org/xml/mathml/1.1CR1/dbmathml.dtd"
DESCRIPTION="MathML docbook DTD."
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="nomirror"

INSTDIR="/usr/share/sgml/docbook/${PF}"


DEPEND="app-text/mathml-xml-dtd"
RDEPEND="dev-libs/libxml2"

src_install() {
	insinto ${INSTDIR}
	doins ${PORTAGE_TMPDIR}/portage/${CATEGORY}/${PF}/distdir/dbmathml.dtd
}

pkg_postinst() {
	[ ! -e /etc/xml ] && mkdir -p /etc/xml/
	if [[ ! -r /etc/xml/catalog ]] ; then
		einfo "Creating root XML catalog"
		xmlcatalog --noout --create /etc/xml/catalog
		[ ! -r /etc/xml/catalog ] && die "Failed creating Root XML Catalog"
	fi
	
	elog "Updating root XML catalog"
	xmlcatalog --noout \
		--del "-//OASIS//DTD DocBook MathML Module V1.1b1//EN" \
		--del "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1/dbmathml.dtd"\
		/etc/xml/catalog

	xmlcatalog --noout \
		--add public "-//OASIS//DTD DocBook MathML Module V1.1b1//EN" "file://${INSTDIR}/dbmathml.dtd"\
		--add system "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1/dbmathml.dtd" "file://${INSTDIR}/dbmathml.dtd" \
		/etc/xml/catalog
}

pkg_postrm() {
	elog "Clean root XML catalog"
	xmlcatalog --noout \
		--del "-//OASIS//DTD DocBook MathML Module V1.1b1//EN" \
		--del "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1/dbmathml.dtd"\
		/etc/xml/catalog
}
