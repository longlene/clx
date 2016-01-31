# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp

DESCRIPTION="Diminished modes are minor modes with no modeline display"
HOMEPAGE="http://www.eskimo.com/~seldon"
SRC_URI="https://github.com/emacsmirror/diminish/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${P} *.el
}

