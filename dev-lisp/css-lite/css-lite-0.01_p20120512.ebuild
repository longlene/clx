# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6ee4e6212ed56943d665df163d2a834b122e6273"

DESCRIPTION="a css grammar for lisp"
HOMEPAGE="https://github.com/paddymul/css-lite"
SRC_URI="https://github.com/paddymul/css-lite/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

