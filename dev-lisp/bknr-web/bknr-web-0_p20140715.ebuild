# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5c30b61818a2f02f6f2e5dc69fd77396ec3afc51"

DESCRIPTION="BKNR Web Components"
HOMEPAGE="https://github.com/hanshuebner/bknr-web"
SRC_URI="https://github.com/hanshuebner/bknr-web/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-interpol
	dev-lisp/cl-ppcre
	dev-lisp/cl-gd
	dev-lisp/alexandria
	dev-lisp/md5
	dev-lisp/cxml
	dev-lisp/unit-test
	dev-lisp/bknr-datastore
	dev-lisp/hunchentoot
	dev-lisp/drakma
	dev-lisp/xhtmlgen
	dev-lisp/puri
	dev-lisp/usocket
	dev-lisp/parenscript
	dev-lisp/yason
"
BDEPEND=""
