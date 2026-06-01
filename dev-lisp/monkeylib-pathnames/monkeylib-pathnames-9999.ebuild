# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Library to smooth over some implementation differences in treatment of pathnames"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-pathnames/"

EGIT_REPO_URI="https://github.com/gigamonkey/monkeylib-pathnames.git"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

CLSYSTEMS="com.gigamonkeys.pathnames"

RDEPEND="${DEPEND}"
