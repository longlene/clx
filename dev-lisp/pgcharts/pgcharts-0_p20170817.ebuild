# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5cc3e342990375e0342f2b200e4486b1cacb06a4"

DESCRIPTION=""
HOMEPAGE="https://github.com/dimitri/pgcharts"
SRC_URI="https://github.com/dimitri/pgcharts/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
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
	emake
}

src_install() {
	common-lisp-3_src_install
	doman ${PN}.1
}
	
