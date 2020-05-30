# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2f23302acac950aa72c9d5e989f956393e60ca3a"

DESCRIPTION="Route multiple domains on a single hunchentoot acceptor using a single port"
HOMEPAGE="https://github.com/moderninterpreters/hunchentoot-multi-acceptor/"
SRC_URI="https://github.com/moderninterpreters/hunchentoot-multi-acceptor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/usocket
	dev-lisp/cl-str
"
BDEPEND=""
