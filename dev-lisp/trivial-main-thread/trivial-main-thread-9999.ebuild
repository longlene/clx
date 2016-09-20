# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Compatibility library to run things in the main thread"
HOMEPAGE="https://github.com/Shinmera/trivial-main-thread"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/trivial-main-thread.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/bordeaux-threads
	dev-lisp/simple-tasks
"
