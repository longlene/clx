# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION=""
HOMEPAGE="https://code.google.com/p/friso/"
SRC_URI="https://friso.googlecode.com/files/friso-${PV}-src-dict.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/\local//' src/Makefile
}

src_compile() {
	cd src && emake
}

src_install() {
	cd src && emake install
}
