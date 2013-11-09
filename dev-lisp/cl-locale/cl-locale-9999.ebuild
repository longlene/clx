# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Simple i18n library for Common Lisp"
HOMEPAGE="https://github.com/arielnetworks/cl-locale"
SRC_URI=""

EGIT_REPO_URI="https://github.com/arielnetworks/cl-locale.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/anaphora
dev-lisp/arnesi
dev-lisp/cl-annot
dev-lisp/cl-syntax"

src_prepare() {
	sed -i -e '34,45s/^/;/' -e '$a))' ${PN}.asd
}

