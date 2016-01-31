# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Common Lisp package for generating graphviz (dot) files"
HOMEPAGE="https://github.com/michaelw/cl-dot"
SRC_URI="https://github.com/michaelw/cl-dot/archive/cl-dot-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	# remove the annoy static file dependency
	sed -i -e '17,25s/^/;/' -e '$a))' ${PN}.asd
}
