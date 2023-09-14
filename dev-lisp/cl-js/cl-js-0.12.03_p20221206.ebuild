# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3a9a1a887bef6b571922f2820f871935121052a5"

DESCRIPTION="CL-JavaScript is a JavaScript programming language compiler for Common Lisp."
HOMEPAGE="http://marijnhaverbeke.nl/cl-javascript/ http://github.com/akapav/js"
SRC_URI="https://github.com/akapav/js/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parse-js
"

