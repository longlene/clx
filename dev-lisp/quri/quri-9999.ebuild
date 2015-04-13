# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 common-lisp-3

DESCRIPTION="Yet another URI library for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/quri"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/quri.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/babel
dev-lisp/alexandria"

