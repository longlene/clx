# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="340ca3de9d8acb096375625170c71dffd07d74d2"

DESCRIPTION="LLVM to Common Lisp transpiler"
HOMEPAGE="https://github.com/froggey/iota"
SRC_URI="https://github.com/froggey/iota/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/babel
	dev-lisp/nibbles
	dev-lisp/lispbuilder-sdl
"
