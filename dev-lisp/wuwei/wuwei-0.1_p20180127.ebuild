# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a6d713efda075830ed145e71282ba6ff02e1554f"

DESCRIPTION="WuWei -- effortless Ajax web UIs from Common Lisp"
HOMEPAGE="https://github.com/mtravers/wuwei/"
SRC_URI="https://github.com/mtravers/wuwei/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/aserve
	dev-lisp/cl-json
	dev-lisp/mtlisp
	dev-lisp/ironclad
	dev-lisp/drakma
"

src_prepare() {
	eapply_user
	if ! use example ; then
		sed -i '/defsystem\ :wuwei-examples/,$d' ${PN}.asd
		rm -r examples
	fi
}
