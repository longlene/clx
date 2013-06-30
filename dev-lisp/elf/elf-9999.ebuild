# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp library for manipulating ELF files"
HOMEPAGE="https://github.com/eschulte/elf"
SRC_URI=""

EGIT_REPO_UIR="https://github.com/eschulte/elf.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/monkeylib-binary-data
dev-lisp/metabang-bind
dev-lisp/split-sequence
dev-lisp/cl-ppcre"
#trivial-shell just for ecl
