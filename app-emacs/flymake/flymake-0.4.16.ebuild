# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="On-the-fly syntax checks for Emacs"
HOMEPAGE="https://github.com/illusori/emacs-flymake"
SRC_URI="https://github.com/illusori/emacs-flymake/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
	dodoc README*
}

