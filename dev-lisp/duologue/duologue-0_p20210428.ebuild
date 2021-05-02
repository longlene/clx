# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0e0e8e6479415cf7335d5734b3393c59c399b73b"

DESCRIPTION="High level user interaction library for Common Lisp"
HOMEPAGE="https://github.com/mmontone/duologue"
SRC_URI="https://github.com/mmontone/duologue/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/clavier
	dev-lisp/chronicity
	dev-lisp/cl-readline
	dev-lisp/cl-ansi-text
	dev-lisp/drakma
	dev-lisp/cl-fad
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
	
