# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ffa5e9d113f2000bbbdccda634f09e272b1983d"

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

