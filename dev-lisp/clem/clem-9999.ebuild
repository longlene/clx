# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A matrix library for common lisp"
HOMEPAGE="https://github.com/slyrus/clem"
SRC_URI=""

EGIT_REPO_URI="https://github.com/slyrus/clem.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	if ! use test; then
		rm -r test *test*
	fi
	sed -i -e '74,78d' -e '$a))' ${P}.asd
}
