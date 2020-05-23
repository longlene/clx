# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3d77010759e0f8927027f31f2c8b501a19d55e08"

DESCRIPTION="Music player in REPL"
HOMEPAGE="https://github.com/hyotang666/replayer"
SRC_URI="https://github.com/hyotang666/replayer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mixalot
	dev-lisp/mixalot-mp3
	dev-lisp/wav-parser
	dev-lisp/datafly
	dev-lisp/sxql
"
BDEPEND=""
