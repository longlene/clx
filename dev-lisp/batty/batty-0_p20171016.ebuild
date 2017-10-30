# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dad71cff37ab8dd6edb2786dc7c23d372a551d8b"

DESCRIPTION="A 2D Batformer"
HOMEPAGE="https://github.com/sjl/batty"
SRC_URI="https://github.com/sjl/batty/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/beast
	dev-lisp/bordeaux-threads
	dev-lisp/deploy
	dev-lisp/black-tie
	dev-lisp/cl-blt
	dev-lisp/cl-pcg
	dev-lisp/iterate
	dev-lisp/cl-losh
"
