# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="688b1545dd7a4fe355556768bb03f8bd9b847a87"

DESCRIPTION="Common Lisp ZIP library"
HOMEPAGE="http://common-lisp.net/project/zip/"
SRC_URI="https://github.com/bluelisp/zip/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/salza2
	dev-lisp/trivial-gray-streams
	dev-lisp/babel
	dev-lisp/cl-fad
"

