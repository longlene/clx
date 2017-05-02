# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e9b5a36947d01f964aaae2d0611b8b3e7031c95c"

DESCRIPTION="An implementation of TLS and related specifications in Common Lisp"
HOMEPAGE="https://github.com/shrdlu68/cl-tls"
SRC_URI="https://github.com/shrdlu68/cl-tls/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/ironclad
	dev-lisp/alexandria
	dev-lisp/cl-base64
	dev-lisp/fast-io
"
