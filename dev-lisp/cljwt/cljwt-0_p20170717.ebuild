# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="27b0f46c448ac9a81fbc5ee7aeefdbb106e87dde"

DESCRIPTION="A Common Lisp library for issuing and validating JSON Web Tokens"
HOMEPAGE="https://github.com/BnMcGn/cljwt"
SRC_URI="https://github.com/BnMcGn/cljwt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/yason
	dev-lisp/cl-base64
	dev-lisp/flexi-streams
	dev-lisp/split-sequence
"
