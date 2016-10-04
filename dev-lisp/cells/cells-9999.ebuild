# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A Common Lisp implementation of the dataflow programming paradigm"
HOMEPAGE="https://github.com/kennytilton/cells"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kennytilton/cells.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/utils-kt
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd {test,test-cc,test-ephemeral,test-cycle,test-propagation,test-synapse}.lisp cells-test
}
