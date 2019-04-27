# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9cfb6c228753a752d9326a8b39a77b77f790263c"

DESCRIPTION=""
HOMEPAGE="https://github.com/RailsOnLisp/thot"
SRC_URI="https://github.com/RailsOnLisp/thot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/bordeaux-queue
	dev-lisp/bordeaux-set
	dev-lisp/bordeaux-threads
	dev-lisp/babel-stream
	dev-lisp/cffi-dirent
	dev-lisp/cffi-epoll
	dev-lisp/cffi-socket
	dev-lisp/cffi-stat
	dev-lisp/cl-debug
	dev-lisp/cl-stream
	dev-lisp/html-entities
	dev-lisp/rol-uri
	dev-lisp/cl-str
	dev-lisp/trivial-utf8
	dev-lisp/unistd-stream
"
BDEPEND=""
