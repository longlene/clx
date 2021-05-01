# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0dfb3b7e209231d40ab73e8e4a52d0032334bbf7"

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
