# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp RabbitMQ client based on IOLib"
HOMEPAGE="http://cl-rabbit.io"
SRC_URI="https://github.com/cl-rabbit/cl-bunny/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-amqp
	dev-lisp/cl-plus-ssl
	dev-lisp/string-case
	dev-lisp/iolib
	dev-lisp/quri
	dev-lisp/lparallel
	dev-lisp/safe-queue
	dev-lisp/eventfd
	dev-lisp/cl-events
	dev-lisp/blackbird
	dev-lisp/log4cl
	dev-lisp/trivial-backtrace
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
	use example || rm -rf ${PN}.examples.asd examples
}
