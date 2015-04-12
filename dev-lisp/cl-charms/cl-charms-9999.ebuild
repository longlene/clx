# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="cl-charms provides CFFI bindings to libcurses"
HOMEPAGE="http://gitorious.org/cl-charms"
SRC_URI=""

#EGIT_REPO_URI="https://git.gitorious.org/cl-charms/cl-charms.git"
EGIT_REPO_URI="https://github.com/eudoxia0/cl-charms.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/alexandria
"

