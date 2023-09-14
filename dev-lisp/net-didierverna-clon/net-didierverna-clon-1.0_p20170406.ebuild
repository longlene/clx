# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9435fa767fc83b1beafe25cd90762faacd094a15"

DESCRIPTION="The Command-Line Options Nuker"
HOMEPAGE="https://github.com/didierverna/clon"
SRC_URI="https://github.com/didierverna/clon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/named-readtables
	dev-lisp/cffi"

