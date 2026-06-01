# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Lite weight testing framework"
HOMEPAGE="https://github.com/lispy-stuff/clite"

EGIT_REPO_URI="https://github.com/lispy-stuff/clite.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
