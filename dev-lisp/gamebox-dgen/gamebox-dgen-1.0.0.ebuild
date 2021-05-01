# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A procedural dungeon generation library"
HOMEPAGE="https://github.com/mfiano/gamebox-dgen"
SRC_URI="https://github.com/mfiano/gamebox-dgen/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/graph
	dev-lisp/cl-speedy-queue
	dev-lisp/genie
	dev-lisp/simple-logger
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
