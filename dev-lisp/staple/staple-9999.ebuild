# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp tool to generate documentation pages using an HTML template"
HOMEPAGE="https://shinmera.github.io/staple"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/staple.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clip
	dev-lisp/closer-mop
	dev-lisp/cl-ppcre
	dev-lisp/trivial-arguments
	dev-lisp/3bmd
	dev-lisp/hunchentoot
"
