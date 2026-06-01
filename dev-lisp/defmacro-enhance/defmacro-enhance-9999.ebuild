# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Enhancement of defmacro in spirit of let-over-lambda"
HOMEPAGE="https://github.com/mabragor/defmacro-enhance"

EGIT_REPO_URI="https://github.com/mabragor/defmacro-enhance.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/iterate"
