# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="696fce22ea19320ac12813720ef5c0e449cb7c6d"

DESCRIPTION="A kafka client in common lisp"
HOMEPAGE="https://github.com/yehohanan7/cl-kafka"
SRC_URI="https://github.com/yehohanan7/cl-kafka/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/uuid
	dev-lisp/usocket
	dev-lisp/cl-json
	dev-lisp/ironclad
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r test
		sed -e '/defsystem\ #:cl-kafka-test/,$d' -i ${PN}.asd
	fi
}

