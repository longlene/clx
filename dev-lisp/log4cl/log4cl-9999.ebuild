# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp logging framework, modeled after Log4J"
HOMEPAGE="https://github.com/7max/log4cl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/7max/log4cl.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/bordeaux-threads"
