# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A collection of utilities to aid development with CommonQt"
HOMEPAGE="https://shinmera.github.io/qtools"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/qtools.git"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/commonqt
dev-lisp/trivial-garbage
dev-lisp/closer-mop
dev-lisp/named-readtable
dev-lisp/trivial-indent
dev-lisp/form-fiddle
dev-lisp/cl-ppcre
dev-lisp/trivial-main-thread
"
