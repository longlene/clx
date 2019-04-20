# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="146d70f643160ee5dbee1541572bd74487c8c979"

DESCRIPTION="Charset encoding/decoding layer for cl-stream using babel"
HOMEPAGE="https://github.com/cl-stream/babel-stream"
SRC_URI="https://github.com/cl-stream/babel-stream/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/cl-stream
"
BDEPEND=""
