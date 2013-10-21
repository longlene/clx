# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="YAML parser for Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/cl-yaml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/cl-yaml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/cl-autowrap
dev-lisp/split-sequence"

