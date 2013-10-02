# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils

DESCRIPTION="Improved JavaScript editing mode"
HOMEPAGE="https://github.com/mooz/js2-mode"
SRC_URI="https://github.com/mooz/js2-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
}
