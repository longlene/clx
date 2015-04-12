# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils git-2

DESCRIPTION="Show tooltip at point"
HOMEPAGE="https://github.com/emacsmirror/pos-tip"
SRC_URI=""

EGIT_REPO_URI="https://github.com/emacsmirror/pos-tip.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
}
