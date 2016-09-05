# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="An extensible iteration macro library"
HOMEPAGE="https://github.com/Shinmera/for"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/for.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/lambda-fiddle
	dev-lisp/form-fiddle
"
