# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="058181ef8cb9426a43692b715c1022c7962a3942"

DESCRIPTION="A wrapper, with the help of SWIG, to CuDNN from Common Lisp"
HOMEPAGE="https://github.com/AaronJackson/cl-cudnn"
SRC_URI="https://github.com/AaronJackson/cl-cudnn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""
