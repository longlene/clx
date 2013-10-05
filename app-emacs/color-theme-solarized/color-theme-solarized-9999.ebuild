# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils git-2

DESCRIPTION="Solarized Colorscheme for Emacs"
HOMEPAGE="https://github.com/sellout/emacs-color-theme-solarized"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sellout/emacs-color-theme-solarized.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
}
