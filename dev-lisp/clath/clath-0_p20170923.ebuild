# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="062ac9844de6dd03e342df23aa4b409ff445b887"

DESCRIPTION="Clath is single sign-on middleware for Clack"
HOMEPAGE="https://github.com/BnMcGn/clath"
SRC_URI="https://github.com/BnMcGn/clath/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ningle
	dev-lisp/clack
	dev-lisp/alexandria
	dev-lisp/cl-hash-util
	dev-lisp/drakma
	dev-lisp/flexi-streams
	dev-lisp/cl-json
	dev-lisp/cljwt
	dev-lisp/cl-who
	dev-lisp/ubiquitous
	dev-lisp/webhax
	dev-lisp/north
"
