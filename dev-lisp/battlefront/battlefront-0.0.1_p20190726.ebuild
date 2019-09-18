# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7e661c116315419ee17ec688a3f1725b480bc956"

DESCRIPTION="chaotic 2D overhead shooter inspired by Star Wars: Battlefront"
HOMEPAGE="https://github.com/noffle/battlefront"
SRC_URI="https://github.com/noffle/battlefront/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
	dev-lisp/cl-opengl
	dev-lisp/pngload
	dev-lisp/3d-vectors
"
BDEPEND=""
