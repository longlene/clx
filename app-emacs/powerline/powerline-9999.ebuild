# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils git-2

DESCRIPTION="emacs powerline from milkypostman"
HOMEPAGE="https://github.com/milkypostman/powerline"
SRC_URI=""

EGIT_REPO_URI="https://github.com/milkypostman/powerline.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
	dodoc README*
}
