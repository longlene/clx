# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A fast binary storage format for Plump documents"
HOMEPAGE="http://shinmera.github.io/plump-bundle/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/plump-bundle.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/plump-dom
	dev-lisp/babel
	dev-lisp/fast-io
	dev-lisp/closer-mop
"
