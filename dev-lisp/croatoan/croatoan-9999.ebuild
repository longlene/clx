# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Lisp bindings for the Ncurses terminal library"
HOMEPAGE="https://github.com/McParen/croatoan/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/McParen/croatoan.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/ncurses
dev-lisp/cffi"
