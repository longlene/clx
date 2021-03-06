# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3286355fdb6c8f285e98177213dbdf4278e86420"

DESCRIPTION="Provides LISP-N --- extensible namespaces in Common Lisp"
HOMEPAGE="https://github.com/guicho271828/lisp-namespace"
SRC_URI="https://github.com/guicho271828/lisp-namespace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}.test.asd
}
