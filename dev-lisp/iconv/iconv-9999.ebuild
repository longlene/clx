# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="iconv(man 3 iconv) library for Common Lisp"
HOMEPAGE="https://github.com/quek/cl-iconv"

EGIT_REPO_URI="https://github.com/quek/cl-iconv.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iolib
virtual/libiconv"

src_prepare() {
	rm Makefile
}
