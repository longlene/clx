# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

EGIT_COMMIT="55621ac192d00fa7848c5a1b0c4d7a9944b795f6"

DESCRIPTION="common lispで書いた小さいEmacsライクなエディタ"
HOMEPAGE="https://github.com/cxxxr/lem"
SRC_URI="https://github.com/cxxxr/lem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/cl-charms
	dev-lisp/cl-fad
	dev-lisp/alexandria
	app-emacs/slime
	dev-lisp/trivial-gray-streams
	dev-lisp/cl-ppcre
	dev-lisp/babel
	dev-lisp/iterate
"
