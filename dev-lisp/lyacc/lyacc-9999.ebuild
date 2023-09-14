# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Yet another LALR(1) parser generator for Lisp"
HOMEPAGE="https://github.com/m2ym/lyacc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/m2ym/lyacc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

