# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3
if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ceramic/ceramic.git"
else
	inherit vcs-snapshot
	EGIT_COMMIT="94551b4ba26c83314a1659e86ae2efdd841777cd"
	SRC_URI="https://github.com/ceramic/ceramic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Desktop web apps with Common Lisp"
HOMEPAGE="http://ceramic.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/clack
	dev-lisp/external-program
	dev-lisp/trivial-build
	dev-lisp/trivial-download
	dev-lisp/trivial-exe
	dev-lisp/trivial-extract
	dev-lisp/trivial-compress
	dev-lisp/electron-tools
	dev-lisp/uiop
	dev-lisp/uuid
	dev-lisp/copy-directory
	dev-lisp/remote-js
"

src_prepare() {
	use test || rm -r t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
