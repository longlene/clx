# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Common Lisp interface for Enchant spell-checker library"
HOMEPAGE="https://github.com/tlikonen/cl-enchant"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tlikonen/cl-enchant.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
app-text/enchant"

