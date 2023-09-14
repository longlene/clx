# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="teepeedee is a small, hopefully scalable, single-threaded file server"
HOMEPAGE="http://john.fremlin.org/programs/teepeedee/"
SRC_URI="http://john.fremlin.org/programs/teepeedee/download/teepeedee-${PV}pre.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	./bootstrap
}

src_install() {
	emake install
}
