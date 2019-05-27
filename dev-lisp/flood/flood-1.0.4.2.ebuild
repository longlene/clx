# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Comfortable, powerful and tiny logging library for Common Lisp"
HOMEPAGE="https://github.com/epuccini/flood"
SRC_URI="https://github.com/epuccini/flood/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/trivial-features
	dev-lisp/bordeaux-threads
	dev-lisp/cl-ppcre
	app-emacs/slime
	dev-lisp/cl-who
	dev-lisp/lparallel
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd ${PN}-example.asd test.lisp example.lisp
}
