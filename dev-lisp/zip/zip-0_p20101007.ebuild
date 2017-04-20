# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="152671f4444c32bec7556f814f0701b51a597455"

DESCRIPTION="Common Lisp ZIP library"
HOMEPAGE="http://common-lisp.net/project/zip/"
SRC_URI="https://github.com/mcna/zip/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/flexi-streams
	dev-lisp/salza2
	dev-lisp/trivial-gray-streams
"

