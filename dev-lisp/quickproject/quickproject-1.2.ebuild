# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3
DESCRIPTION="Quickproject creates the skeleton of a Common Lisp project."
HOMEPAGE="https://github.com/xach/quickproject"
SRC_URI="https://github.com/xach/${PN}/archive/release-${PV}.tar.gz -> ${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-fad
dev-lisp/html-template"

