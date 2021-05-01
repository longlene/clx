# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d0dc343e6406ebed59defc61e0fdd86a84c3f360"

DESCRIPTION="A minimalist CouchDB database client"
HOMEPAGE="https://github.com/cmoore/cl-mango/"
SRC_URI="https://github.com/cmoore/cl-mango/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/yason
	dev-lisp/json-mop
	dev-lisp/log4cl
"
BDEPEND=""
