# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp eutils git-2

DESCRIPTION="Eldoc plugin for C source file"
HOMEPAGE="https://github.com/nflath/c-eldoc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nflath/c-eldoc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
}
