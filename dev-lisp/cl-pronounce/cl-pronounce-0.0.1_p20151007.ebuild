# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a74e67a2275e37164a607f696d112ca9ba63a4d4"

DESCRIPTION="An english number pronounciation service"
HOMEPAGE="https://github.com/inaimathi/cl-pronounce"
SRC_URI="https://github.com/inaimathi/cl-pronounce/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-handlers
	dev-lisp/woo
	dev-lisp/alexandria
	dev-lisp/cl-who
	dev-lisp/parenscript
"
