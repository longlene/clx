# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

DESCRIPTION="AMQP 0.9.1 with RabbitMQ extensions in Common Lisp"
HOMEPAGE="https://github.com/cl-rabbit/cl-amqp"
SRC_URI="https://github.com/cl-rabbit/cl-amqp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/nibbles
	dev-lisp/cl-interpol
	dev-lisp/wu-decimal
	dev-lisp/local-time
	dev-lisp/collectors
	dev-lisp/trivial-utf8
	dev-lisp/fast-io
	dev-lisp/log4cl
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
}
