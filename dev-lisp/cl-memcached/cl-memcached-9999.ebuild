# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp interface to the memcached object caching system"
HOMEPAGE="https://github.com/arielnetworks/cl-memcached"
SRC_URI=""

EGIT_REPO_URI="https://github.com/arielnetworks/cl-memcached.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/usocket
dev-lisp/split-sequence
dev-lisp/flexi-streams"

