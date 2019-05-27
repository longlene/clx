# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="04a5850cce7d635ec2d0e9e4e01d33009181fb20"

DESCRIPTION="Lisp Web Toolkit"
HOMEPAGE="http://web-toolkit.org/"
SRC_URI="https://github.com/xh4/web-toolkit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/cxml-dom
	dev-lisp/closure-html
	dev-lisp/cl-json
	dev-lisp/drakma
	dev-lisp/quri
	dev-lisp/hunchentoot
	dev-lisp/clack
	dev-lisp/websocket-driver-server
"
BDEPEND=""
