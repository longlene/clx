# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Enhancement of defmacro in spirit of let-over-lambda"
HOMEPAGE="https://github.com/mabragor/defmacro-enhance"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mabragor/defmacro-enhance.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/iterate"

