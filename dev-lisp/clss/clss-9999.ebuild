# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="CSS Like Simple Selectors"
HOMEPAGE="https://github.com/Shinmera/CLSS"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/CLSS.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/array-utils
dev-lisp/plump
"
