# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="db559aff4b972193cb6d14a9dd877b011f387690"

DESCRIPTION=" Web scraping library"
HOMEPAGE="https://github.com/walpurgisnatch/stepster/"
SRC_URI="https://github.com/walpurgisnatch/stepster/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/plump
	dev-lisp/clss
	dev-lisp/cl-ppcre
	dev-lisp/babel
	dev-lisp/jonathan
	dev-lisp/cl-reexport
"
BDEPEND=""
