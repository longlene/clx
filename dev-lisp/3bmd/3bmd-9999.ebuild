# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="markdown processor in CL using esrap parser."
HOMEPAGE="https://github.com/3b/3bmd"
SRC_URI=""

EGIT_REPO_URI="git://github.com/3b/3bmd.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/esrap
	dev-lisp/split-sequence
"

