# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="28b015be54713d41a4e974bc1c22eed70b36ecb5"

DESCRIPTION="A pseudo 3d multiplayer roguelike"
HOMEPAGE="https://github.com/ahungry/pseudo"
SRC_URI="https://github.com/ahungry/pseudo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/usocket
	dev-lisp/jsown
	dev-lisp/clsql
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/trivial-shell
	dev-lisp/hunchentoot
	dev-lisp/cl-fad
	dev-lisp/cl-who
	dev-lisp/parenscript
	dev-lisp/cl-json
	dev-lisp/clws
	dev-lisp/glyphs
	dev-lisp/defjs
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all socket.io www
}
