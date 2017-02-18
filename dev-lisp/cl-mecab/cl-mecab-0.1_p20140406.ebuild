# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b599f99fc90e70bfb623b642a11786c423b613ce"

DESCRIPTION="mecab bindings for Common Lisp"
HOMEPAGE="https://github.com/t-sin/cl-mecab"
SRC_URI="https://github.com/t-sin/cl-mecab/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-annot
	dev-lisp/cffi
	dev-lisp/babel
	dev-lisp/guess
	app-text/mecab
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
