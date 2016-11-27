# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="common lispで書いた小さいEmacsライクなエディタ"
HOMEPAGE="https://github.com/cxxxr/lem"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cxxxr/lem.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-charms
	dev-lisp/cl-fad
	dev-lisp/osicat
	app-emacs/slime
	dev-lisp/trivial-gray-streams
	dev-lisp/cl-ppcre
	dev-lisp/babel
"
