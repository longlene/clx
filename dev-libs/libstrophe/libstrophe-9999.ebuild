# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="A simple, lightweight C library for writing XMPP clients"
HOMEPAGE="http://strophe.im/libstrophe/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/strophe/libstrophe.git"

LICENSE="GPL-3 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	./bootstrap.sh
}
