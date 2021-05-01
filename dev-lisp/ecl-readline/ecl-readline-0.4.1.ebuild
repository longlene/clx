# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="ecl-readline provides top-level readline support for ECL"
HOMEPAGE="http://common-lisp.net/project/ecl-readline/"
SRC_URI="http://www.common-lisp.net/project/ecl-readline/releases/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ecls
"

src_prepare() {
	eapply_user
	sed -i 's#g_completions\ =\ malloc#g_completions = (char **)malloc#' ecl-completions.lisp
}

