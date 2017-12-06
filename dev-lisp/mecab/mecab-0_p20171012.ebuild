# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0af0e5c20a4c3c6eb56f4ebf5d3deeeb3f082dfb"

DESCRIPTION="mecab common lisp binding"
HOMEPAGE="https://github.com/cxxxr/cl-mecab"
SRC_URI="https://github.com/cxxxr/cl-mecab/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/cffi
	app-text/mecab
"
