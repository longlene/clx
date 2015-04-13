# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A restas module to publish static files"
HOMEPAGE="https://github.com/kevinlynx/restas.file-publisher"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kevinlynx/restas.file-publisher.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

CLSYSTEMS="restas.file-publisher"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/restas
dev-lisp/cl-fad"

