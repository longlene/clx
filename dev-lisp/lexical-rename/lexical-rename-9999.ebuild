# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Less than SYMBOL-MACROLET, alpha-conversion for CL"
HOMEPAGE="https://github.com/Ferada/lexical-rename"

EGIT_REPO_URI="https://github.com/Ferada/lexical-rename.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
