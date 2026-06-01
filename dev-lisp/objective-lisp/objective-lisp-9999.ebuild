# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="An effort to bake CLOS further into CL"
HOMEPAGE="https://github.com/Inaimathi/objective-lisp"

EGIT_REPO_URI="https://github.com/Inaimathi/objective-lisp.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
