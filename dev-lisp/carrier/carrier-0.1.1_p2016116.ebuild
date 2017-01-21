# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a00696b073f5c0ef9e4cc81dda30e600985eae45"

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
