# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c2dcb3b5ec0e485484be681fe17c4e81e58790d9"

DESCRIPTION="Common Lisp library for handling bit vectors, bit vector arithmetic, and type conversions"
HOMEPAGE="https://github.com/thephoeron/bit-smasher/"
SRC_URI="https://github.com/thephoeron/bit-smasher/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-base58
	dev-lisp/cl-base64
	dev-lisp/ironclad"

