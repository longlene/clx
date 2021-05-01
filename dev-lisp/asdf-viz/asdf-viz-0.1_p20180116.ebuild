# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7e6436f324edd3b522531db946492c4c03c265c0"

DESCRIPTION="ASDF system dependency visualizer"
HOMEPAGE="https://github.com/guicho271828/asdf-viz"
SRC_URI="https://github.com/guicho271828/asdf-viz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-emacs/slime
	dev-lisp/iterate
	dev-lisp/cl-dot
	dev-lisp/trivia
	dev-lisp/closer-mop
"
