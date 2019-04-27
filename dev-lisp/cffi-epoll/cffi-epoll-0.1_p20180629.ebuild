# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6ee36e99a66bd0246a6147b72e6f84673b3d0a41"

DESCRIPTION="Common Lisp wrapper for Linux epoll syscall"
HOMEPAGE="https://github.com/cffi-posix/cffi-epoll"
SRC_URI="https://github.com/cffi-posix/cffi-epoll/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cffi-errno
	dev-lisp/cffi-unistd
"
BDEPEND=""
