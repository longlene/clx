# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="CL interface to the GIT binary"
HOMEPAGE="http://shinmera.github.io/legit/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/legit.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/simple-inferiors
	dev-lisp/lambda-fiddle
	dev-lisp/cl-ppcre
	dev-lisp/documentation-utils
"
