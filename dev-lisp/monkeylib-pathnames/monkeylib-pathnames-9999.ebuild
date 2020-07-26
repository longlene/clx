# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Library to smooth over some implementation differences in treatment of pathnames"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-pathnames/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-pathnames.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

CLSYSTEMS="com.gigamonkeys.pathnames"

DEPEND=""
RDEPEND="${DEPEND}"

