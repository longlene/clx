# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="857336a39b6d31ef0ce12e47a7a5f846c35375a2"

DESCRIPTION="FSet, the functional collections library for Common Lisp"
HOMEPAGE="https://github.com/slburson/fset"
SRC_URI="https://github.com/slburson/fset/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/misc-extensions
	dev-lisp/mt19937
"
