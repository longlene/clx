# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Foreign friendly arrays for Common Lisp"
HOMEPAGE="http://cliki.net/ffa"

EGIT_REPO_URI="https://github.com/tpapp/ffa.git"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
