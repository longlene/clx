# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Common Lisp bindings for DevIL"
HOMEPAGE="https://github.com/sykopomp/cl-devil"
SRC_URI="https://github.com/sykopomp/cl-devil/archive/v0.1.4.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/alexandria
media-libs/devil"

