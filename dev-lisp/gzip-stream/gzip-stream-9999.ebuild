# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="GZIP-STREAM provides a few utilities for reading and writing streams in the gzip format"
HOMEPAGE="http://common-lisp.net/project/gzip-stream/"

EGIT_REPO_URI="https://github.com/mcna/gzip-stream.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/salza2
	dev-lisp/flexi-streams
	dev-lisp/trivial-gray-streams
"

