# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit sgml-catalog

MY_PV=${PV/_beta/b}

DESCRIPTION="Docbook DTD for MathML"
HOMEPAGE="http://www.docbook.org/xml/mathml/"
SRC_URI="http://www.docbook.org/xml/mathml/${MY_PV}/dbmathml.dtd -> dbmathml-${PV}.dtd"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-text/mathml-xml-dtd"
RDEPEND="dev-libs/libxml2
	app-text/docbook-xml-dtd:4.3
	>=app-text/build-docbook-catalog-1.6
	${DEPEND}"

S=${WORKDIR}

sgml-catalog_cat_include "/etc/sgml/mathml-docbook-${PV}.cat" \
	"/usr/share/sgml/docbook/${P#docbook-}/docbook.cat"

src_unpack() {
	cp "${DISTDIR}"/dbmathml-${PV}.dtd "${S}" || die
}

src_prepare() {
	mv dbmathml-${PV}.dtd dbmathml.dtd || die
	cat <<-"EOF" > docbook.cat || die
		PUBLIC "-//OASIS//DTD DocBook MathML Module V${MY_PV}//EN" "dbmathml.dtd"
	EOF
}

src_install() {
	insinto /usr/share/sgml/docbook/${P#docbook-}
	doins *.cat *.dtd || die
}

pkg_postinst() {
	build-docbook-catalog || die
	sgml-catalog_pkg_postinst || die

	xmlcatalog --noout \
		--add public "-//OASIS//DTD DocBook MathML Module V${MV_PV}//EN" "/usr/share/sgml/docbook/${P#docbook-}/dbmathml.dtd" \
		--add rewriteSystem "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1" "/usr/share/sgml/docbook/${P#docbook-}" \
		"${EPREFIX}"/etc/xml/docbook \
	|| die
}

pkg_postrm() {
	build-docbook-catalog || die
	sgml-catalog_pkg_postrm || die

	xmlcatalog --noout \
		--del public "-//OASIS//DTD DocBook MathML Module V${MV_PV}//EN" \
		--del rewriteSystem "http://www.oasis-open.org/docbook/xml/mathml/1.1CR1/dbmathml.dtd" \
		"${EPREFIX}"/etc/xml/docbook \
	|| die
}
