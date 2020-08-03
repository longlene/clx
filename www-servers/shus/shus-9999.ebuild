# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-r3

DESCRIPTION="A tiny HTTP server for static sites"
HOMEPAGE="https://github.com/dimkr/shus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dimkr/shus.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin shus-index
	dosbin shusd
	doman shusd.8
	doman shus-index.1
}
