# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c35693d086ed2f9b8962b1563b93f5dce4256de3"

DESCRIPTION="A Common Lisp re-binding of the C binding for the zmq transport layer"
HOMEPAGE="https://github.com/lhope/cl-czmq3"
SRC_URI="https://github.com/lhope/cl-czmq3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	net-libs/czmq
"
