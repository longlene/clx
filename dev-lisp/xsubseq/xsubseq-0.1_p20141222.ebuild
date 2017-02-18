# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="131835b3025e9856058486dcbefc17ea7d8c156c"

DESCRIPTION="Efficient way to use \"subseq\"s in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/xsubseq/"
SRC_URI="https://github.com/fukamachi/xsubseq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/prove )
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
