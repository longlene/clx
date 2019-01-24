# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5b01a093a82b76c9e200a1837acc0060df2c4e85"

DESCRIPTION="A lightweight, async HTTP client"
HOMEPAGE="https://github.com/orthecreedence/carrier"
SRC_URI="https://github.com/orthecreedence/carrier/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/fast-io
	dev-lisp/cl-async
	dev-lisp/blackbird
	dev-lisp/quri
	dev-lisp/fast-http
	dev-lisp/fast-io
"
