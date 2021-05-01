# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="iconv(man 3 iconv) library for Common Lisp"
HOMEPAGE="https://github.com/quek/cl-iconv"
SRC_URI=""

EGIT_REPO_URI="https://github.com/quek/cl-iconv.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iolib
virtual/libiconv"

src_prepare() {
	rm Makefile
}
