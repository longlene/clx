# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A printf implementation in Common Lisp"
HOMEPAGE="https://github.com/dlowe-net/printf"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dlowe-net/printf.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/smug
"
