# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 multilib

DESCRIPTION="oracle driver for go that using database/sql"
HOMEPAGE="http://mattn.kaoriya.net/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mattn/go-oci8.git"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/go
dev-db/oracle-instantclient-basic"

GOPKG="${PN}"

src_install() {
	insinto "/usr/$(get_libdir)/go/src/pkg/${GOPKG}"
	doins *.go
}
