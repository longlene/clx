# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 multilib

DESCRIPTION="go xmpp"
HOMEPAGE="https://github.com/mattn/go-xmpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mattn/go-xmpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/go"

GOPKG="${PN}"

src_install() {
	insinto "/usr/$(get_libdir)/go/src/pkg/${GOPKG}"
	doins *.go
}
