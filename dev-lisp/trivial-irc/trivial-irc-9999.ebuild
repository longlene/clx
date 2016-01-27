# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Trivial IRC client library for Common Lisp"
HOMEPAGE="https://github.com/karvus/trivial-irc/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/karvus/trivial-irc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/usocket
"
