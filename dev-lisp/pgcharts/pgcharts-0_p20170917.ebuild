# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9a83c3d6344d53d0da69cec0ea9b41ee858f9f75"

DESCRIPTION="Turn your PostgreSQL queries into Charts"
HOMEPAGE="https://github.com/dimitri/pgcharts"
SRC_URI="https://github.com/dimitri/pgcharts/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/postmodern
	dev-lisp/simple-date
	dev-lisp/esrap
	dev-lisp/py-configparser
	dev-lisp/split-sequence
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/hunchentoot
	dev-lisp/yason
	dev-lisp/closer-mop
	dev-lisp/daemon
	dev-lisp/cl-who
	dev-lisp/trivial-backtrace
	dev-lisp/drakma
	dev-lisp/graph
"

src_compile() {
	:
}

src_install() {
	common-lisp-3_src_install
	doman ${PN}.1
}
	
