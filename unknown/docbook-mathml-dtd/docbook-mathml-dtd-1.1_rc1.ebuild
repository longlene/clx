# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit versionator

MY_PV="$(version_format_string '$1.$2${3/rc/CR}')"

DESCRIPTION="MathML docbook DTD"
HOMEPAGE="http://www.docbook.org/xml/mathml/"
SRC_URI="http://www.docbook.org/xml/mathml/${MY_PV}/dbmathml.dtd -> dbmathml-${MY_PV}.dtd"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-text/mathml-xml-dtd"
RDEPEND="dev-libs/libxml2
	${DEPEND}"

src_unpack() {
	:
}

src_install() {
	INSTALL_DIRECTORY="/usr/share/sgml/docbook/${PN#docbook-}-${MY_PV}"

	insinto "${INSTALL_DIRECTORY}"
	newins "${DISTDIR}"/dbmathml-"${MY_PV}".dtd dbmathml.dtd || die
}

pkg_postinst() {
	ebegin "Updating root XML catalog"
	xmlcatalog --noout \
		--add public "-//OASIS//DTD DocBook MathML Module V1.1b1//EN" "${INSTALL_DIRECTORY}/dbmathml.dtd"\
		--add system "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1/dbmathml.dtd" "${INSTALL_DIRECTORY}/dbmathml.dtd" \
		"${ROOT}"etc/xml/catalog
	eend $?
}

pkg_postrm() {
	ebegin "Clean root XML catalog"
	xmlcatalog --noout \
		--del "-//OASIS//DTD DocBook MathML Module V1.1b1//EN" \
		--del "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1/dbmathml.dtd"\
		"${ROOT}"/etc/xml/catalog
	eend $?
}
