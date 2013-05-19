# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils

DESCRIPTION="Modular in-buffer completion framework"
HOMEPAGE="https://github.com/emacsmirror/company"
SRC_URI="https://github.com/emacsmirror/company/archive/0.6.9.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
app-emacs/slime
app-emacs/auto-complete"

src_prepare() {
	rm Makefile
}

src_install() {
	elisp-install ${PN} *.el
	dodoc README*
}
