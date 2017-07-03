# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f8368767b33ffcceecab315ba5f2ffcd151c1cd5"

DESCRIPTION="An easy Common Lisp REST/ajax service definer for hunchentoot"
HOMEPAGE="https://github.com/bonkzwonil/defrest"
SRC_URI="https://github.com/bonkzwonil/defrest/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
"
