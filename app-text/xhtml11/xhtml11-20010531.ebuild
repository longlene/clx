inherit sgml-catalog eutils

DESCRIPTION="DTDs for the eXtensible HyperText Markup Language 1.1"
HOMEPAGE="http://www.w3.org/TR/xhtml11/"
SRC_URI="http://www.w3.org/TR/xhtml11/xhtml11.tgz"
LICENSE="W3C"

SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="app-text/sgml-common
	dev-libs/libxml2"
RDEPEND=""

sgml-catalog_cat_include "/etc/sgml/${PN}.cat" \
	"/usr/share/sgml/${PN}/xhtml11.cat"

xml_catalog_setup() {
	CATALOG="${ROOT}etc/xml/catalog"
	XMLTOOL="${ROOT}usr/bin/xmlcatalog"
	DTDDIR="${ROOT}usr/share/sgml/${PN}"

	[ -x "${XMLTOOL}" ] || return 1

	return 0
}

src_install() {
	insinto /usr/share/sgml/${PN}
	doins DTD/xhtml11.cat DTD/*.dcl DTD/*.dtd DTD/*.mod
	insinto /etc/sgml
	dodoc *.pdf *.ps
	dohtml *.html *.gif *.css
}

pkg_postinst() {
	sgml-catalog_pkg_postinst
	xml_catalog_setup || return

	einfo "Installing xhtml11 in the global XML catalog"

	$XMLTOOL --noout --add 'public' '-//W3C//DTD XHTML 1.1//EN' \
		${DTDDIR}/xhtml11-flat.dtd $CATALOG
	$XMLTOOL --noout --add 'rewriteSystem' 'http://www.w3.org/TR/xhtml11/DTD' \
		${DTDDIR} $CATALOG
	$XMLTOOL --noout --add 'rewriteURI' 'http://www.w3.org/TR/xhtml11/DTD' \
		${DTDDIR} $CATALOG
}

pkg_postrm() {
	sgml-catalog_pkg_postrm
	xml_catalog_setup || return

	if [ -d "$DTDDIR" ]; then
		einfo "The xhtml11 data directory still exists."
		einfo "No entries will be removed from the XML catalog."
		return
	fi

	einfo "Removing xhtml11 from the global XML catalog"

	$XMLTOOL --noout --del '-//W3C//DTD XHTML 1.1//EN' $CATALOG
	$XMLTOOL --noout --del 'http://www.w3.org/TR/xhtml11/DTD' $CATALOG
}
