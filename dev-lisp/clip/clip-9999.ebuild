# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A Common Lisp HTML templating engine"
HOMEPAGE="https://shinmera.github.io/clip"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/clip.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/array-utils
dev-lisp/lquery
"
