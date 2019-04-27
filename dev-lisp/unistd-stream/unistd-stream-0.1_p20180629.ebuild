# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b718bde6612afc8e3d5d36930f75fd07b9f29386"

DESCRIPTION="Unix file descriptor layer for cl-stream"
HOMEPAGE="https://github.com/cl-stream/unistd-stream"
SRC_URI="https://github.com/cl-stream/unistd-stream/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi-fcntl
	dev-lisp/cffi-unistd
	dev-lisp/cl-stream
"
BDEPEND=""
