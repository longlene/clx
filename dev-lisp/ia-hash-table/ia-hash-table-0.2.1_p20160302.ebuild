# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5e4806c40872bb88a8d19e6f5df57a2933ad0df4"

DESCRIPTION="Indifferent access hash-tables for Common Lisp"
HOMEPAGE="https://github.com/deadtrickster/ia-hash-table"
SRC_URI="https://github.com/deadtrickster/ia-hash-table/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	test? ( dev-lisp/prove dev-lisp/log4cl dev-lisp/mw-equiv dev-lisp/interpol )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd t
}
