inherit gnome2 python distutils virtualx

DESCRIPTION="GNOME-compatible podcast and videoblog reader"
HOMEPAGE="http://penguintv.sourceforge.net/"
SRC_URI="mirror://sourceforge/penguintv/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

DEPEND=">=dev-lang/python-2.2.3-r3"

RDEPEND="${DEPEND}
	>=dev-python/pysqlite-2.0.0
	>=dev-python/pycurl-7.11
	dev-python/pyxml
	dev-python/gnome-python
	dev-python/gnome-python-extras
	"

PYTHON_MODNAME="penguintv"

src_install() {	
	      distutils_src_install
}

pkg_postinst() {

	distutils_pkg_postinst
	gnome2_pkg_postinst # need this for gconf schemas

	}

pkg_postrm() {

	distutils_pkg_postrm
	gnome2_pkg_postrm

}
