# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mattn/go-oci8"
EGIT_COMMIT="dd54a79fa8d0459d8a47f808ba13af2c4382cafe"

DESCRIPTION="oracle driver for go that using database/sql"
HOMEPAGE="http://mattn.kaoriya.net/"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/oracle-instantclient
	dev-go/go-net
"

