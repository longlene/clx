# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Easy particle systems with fine grained control"
HOMEPAGE="http://shinmera.github.io/flare"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/flare.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lambda-fiddle
	dev-lisp/iterate
	dev-lisp/array-utils
	dev-lisp/trivial-garbage
	dev-lisp/3d-vectors
	dev-lisp/documentation-utils
"
