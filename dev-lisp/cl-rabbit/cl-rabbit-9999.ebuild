# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3

DESCRIPTION="RabbitMQ interface to Common Lisp"
HOMEPAGE="https://github.com/deadtrickster/cl-rabbit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/deadtrickster/cl-rabbit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/wu-decimal
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf tests cl-rabbit-tests.asd
}
