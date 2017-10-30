# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9d1b1ab6424b496d936f9a99d4f697a6557d879e"

DESCRIPTION="CCL compatibility module for Common Lisp"
HOMEPAGE="https://github.com/phoe/ccl-compat"
SRC_URI="https://github.com/phoe/ccl-compat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
"
