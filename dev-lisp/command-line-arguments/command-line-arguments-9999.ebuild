# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Trivial interface for getting and parsing command-line-arguments"
HOMEPAGE="http://common-lisp.net/project/qitab/"
SRC_URI=""

EGIT_REPO_URI="git://common-lisp.net/projects/qitab/command-line-arguments.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
>dev-lisp/asdf-2.33"

