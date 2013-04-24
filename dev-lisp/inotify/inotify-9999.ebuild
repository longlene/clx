# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Interface to linux inotify(7)"
HOMEPAGE="https://github.com/stassats/inotify"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stassats/inotify.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iolib"

