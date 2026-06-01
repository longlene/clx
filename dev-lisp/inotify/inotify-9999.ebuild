# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Interface to linux inotify(7)"
HOMEPAGE="https://github.com/stassats/inotify"

EGIT_REPO_URI="https://github.com/stassats/inotify.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iolib"
