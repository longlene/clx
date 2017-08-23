# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Simple and easy to use modern command line argument parser for common lisp"
HOMEPAGE="https://github.com/renard/cl-cli"
SRC_URI="https://github.com/renard/cl-cli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
"

src_prepare() {
	eapply_user
	rm ${PN}-test.lisp
}
