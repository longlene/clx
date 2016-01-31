# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp library for handling bit vectors, bit vector arithmetic, and type conversions"
HOMEPAGE="https://github.com/thephoeron/bit-smasher/"
SRC_URI=""

EGIT_SRC_URI="https://github.com/thephoeron/bit-smasher.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-base58
dev-lisp/cl-base64
dev-lisp/ironclad"

