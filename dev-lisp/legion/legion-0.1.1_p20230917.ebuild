# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="281dba5e509dad85b4638a92f33dabf7a2dd96f0"

DESCRIPTION="Simple multithreading worker mechanism"
HOMEPAGE="http://gamera.wikia.com/wiki/Legion"
SRC_URI="http://github.com/fukamachi/legion/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-speedy-queue
	dev-lisp/bordeaux-threads
	dev-lisp/vom
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
