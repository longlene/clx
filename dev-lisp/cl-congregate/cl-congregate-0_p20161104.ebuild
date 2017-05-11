# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6b4036a7fb287c9f94456fe06ae3d4a4d68248c3"

DESCRIPTION="A service and protocol for coordinating recurring get-togethers between many humans"
HOMEPAGE="https://github.com/inaimathi/cl-congregate"
SRC_URI="https://github.com/inaimathi/cl-congregate/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/house
	dev-lisp/drakma
	dev-lisp/fact-base
	dev-lisp/yason
	dev-lisp/cl-who
	dev-lisp/cl-css
	dev-lisp/parenscript
	dev-lisp/local-time
	dev-lisp/split-sequence
	dev-lisp/cl-ppcre
"
