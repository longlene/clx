# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5fe283147faa1acf63715effffd8cd49012453da"

DESCRIPTION="A simple message logging system"
HOMEPAGE="https://github.com/mfiano/simple-logger"
SRC_URI="https://github.com/mfiano/simple-logger/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/local-time
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
