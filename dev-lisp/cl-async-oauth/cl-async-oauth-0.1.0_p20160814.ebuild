# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="391022683b32b2c734ebe1fe8ac293561e84afae"

DESCRIPTION="An oauth 1.0 library built with cl-async and carrier"
HOMEPAGE="https://github.com/l04m33/cl-async-oauth"
SRC_URI="https://github.com/l04m33/cl-async-oauth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/carrier
	dev-lisp/cl-json
	dev-lisp/cl-async
	dev-lisp/blackbird
	dev-lisp/babel
	dev-lisp/quri
	dev-lisp/cl-base64
	dev-lisp/ironclad
"
