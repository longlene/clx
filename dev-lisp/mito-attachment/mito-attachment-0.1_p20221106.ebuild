# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5022a07f667f41906ce3dced827258fed268c36d"

DESCRIPTION="Mito mixin class for file management outside of RDBMS"
HOMEPAGE="https://github.com/fukamachi/mito-attachment"
SRC_URI="https://github.com/fukamachi/mito-attachment/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mito
	dev-lisp/zs3
	dev-lisp/lack
	dev-lisp/trivial-mimes
	dev-lisp/uuid
	dev-lisp/cl-reexport
	dev-lisp/uiop
	dev-lisp/alexandria
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
