# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7f0930a682ec4e50b14ae8e616cfff5d7f5d225b"

DESCRIPTION="RabbitMQ interface to Common Lisp"
HOMEPAGE="https://github.com/lokedhs/cl-rabbit"
SRC_URI="https://github.com/lokedhs/cl-rabbit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cl-ppcre
	net-libs/rabbitmq-c
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf tests cl-rabbit-tests.asd
}