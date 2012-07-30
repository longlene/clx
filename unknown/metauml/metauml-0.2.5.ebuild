inherit latex-package

S=${WORKDIR}/metauml_lib/thrunk
DESCRIPTION="MetaPost package used to create UML diagrams."
SRC_URI="mirror://sourceforge/metauml/${PN}_lib_${PV}.tgz"
HOMEPAGE="http://metauml.sourceforge.net/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 sparc amd64"
IUSE=""

src_install() {
	cd ${S}
	
	insinto ${TEXMF}/metapost/metauml
	doins *.mp

	dodoc License version.txt
}
