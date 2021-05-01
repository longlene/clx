# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A manager for frames within a game loop"
HOMEPAGE="https://github.com/mfiano/gamebox-frame-manager"
SRC_URI="https://github.com/mfiano/gamebox-frame-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/simple-logger
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
