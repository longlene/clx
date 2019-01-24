# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d7c00d0eec4a4fca925fd6a3a256be0b8a4d0dcf"

DESCRIPTION="Simple library of common lisp utilities"
HOMEPAGE="https://github.com/terminal625/utility"
SRC_URI="https://github.com/terminal625/utility/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

