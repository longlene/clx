# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="13fb9ce4a22d2b7e8ad16d911b2a7915436378ba"

DESCRIPTION="mnist dataset on common lisp"
HOMEPAGE="https://github.com/akssri/mnist"
SRC_URI="https://github.com/akssri/mnist/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/matlisp
	dev-lisp/ieee-flaots
	dev-lisp/chipz
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all data
}
