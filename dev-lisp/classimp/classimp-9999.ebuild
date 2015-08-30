# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="common lisp/cffi bindings for Open Asset Import Library"
HOMEPAGE="http://assimp.sourceforge.net/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/3b/classimp.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
"
