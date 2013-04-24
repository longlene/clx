# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils

DESCRIPTION="Emacs auto-complete plugin for Slime symbols"
HOMEPAGE="https://github.com/purcell/ac-slime"
SRC_URI="https://github.com/purcell/ac-slime/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
app-emacs/slime
app-emacs/auto-complete"

src_install() {
	elisp-install ${PN} *.el
	dodoc README*
}
