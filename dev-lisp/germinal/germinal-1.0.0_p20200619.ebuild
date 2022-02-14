# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e886705931262f29777b07c46ae16d04c7ea82ec"

DESCRIPTION="A gemini protocol server in Common Lisp"
HOMEPAGE="https://github.com/jfmcbrayer/germinal"
SRC_URI="https://git.carcosa.net/jmcbray/germinal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/cl-plus-ssl
	dev-lisp/str
	dev-lisp/trivial-mimes
	dev-lisp/ppath
	dev-lisp/osicat
	dev-lisp/cl-interpol
	dev-lisp/quri
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/local-time
	dev-lisp/uax15
"
BDEPEND=""
