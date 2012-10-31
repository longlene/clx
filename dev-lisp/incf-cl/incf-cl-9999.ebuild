# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A collection of convenience functions and macros for Common Lisp"
HOMEPAGE="http://superadditive.com/software/incf-cl/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/jmbr/incf-cl.git"
LICENSE="MIT" #is same to X11 License?
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre"

