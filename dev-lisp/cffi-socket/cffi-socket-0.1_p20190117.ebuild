# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dccd1f4ebb93763b664b482d031b4dcaf51d198b"

DESCRIPTION="Common Lisp wrapper for BSD sockets"
HOMEPAGE="https://github.com/cffi-posix/cffi-socket"
SRC_URI="https://github.com/cffi-posix/cffi-socket/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
