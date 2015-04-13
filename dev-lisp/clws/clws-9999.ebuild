# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="websockets server in CL"
HOMEPAGE="https://github.com/3b/clws"
SRC_URI=""

EGIT_REPO_URI="https://github.com/3b/clws.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="sbcl"

DEPEND=""
RDEPEND="${DEPEND}
sbcl? ( dev-lisp/sbcl )
!sbcl? ( dev-lisp/chanl )
dev-lisp/iolib
dev-lisp/ironclad
dev-lisp/chunga
dev-lisp/cl-base64
dev-lisp/flexi-streams
dev-lisp/split-sequence"

