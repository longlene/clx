# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A WWW::Mechanize work-alike library for Common Lisp."
HOMEPAGE="https://github.com/joachifm/cl-mechanize"
SRC_URI=""

EGIT_REPO_URI="https://github.com/joachifm/cl-mechanize.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/puri
dev-lisp/drakma
dev-lisp/closure-html
dev-lisp/cxml-stp
dev-lisp/cl-ppcre"

