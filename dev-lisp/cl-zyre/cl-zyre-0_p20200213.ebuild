# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a80ba8cbaf40d7e9334154d2a35627bb441fe745"

DESCRIPTION="Zyre and ZeroMQ for Common Lisp"
HOMEPAGE="https://github.com/jesseoff/cl-zyre/"
SRC_URI="https://github.com/jesseoff/cl-zyre/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/trivia
	dev-lisp/osicat
	dev-lisp/log4cl
	dev-lisp/cl-ppcre
	dev-lisp/cl-json
	dev-lisp/local-time
	dev-lisp/local-time-duration
"
BDEPEND=""
