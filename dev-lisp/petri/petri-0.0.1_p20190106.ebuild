# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2717b8b15bb973220906c80fcc5da43900654596"

DESCRIPTION="Implementation of Petri nets in Common Lisp"
HOMEPAGE="https://github.com/phoe/petri/"
SRC_URI="https://github.com/phoe/petri/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/1am
	dev-lisp/split-sequence
	dev-lisp/phoe-toolbox
"
BDEPEND=""
