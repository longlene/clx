# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot autotools

EGIT_COMMIT="a8d15f20f39a737c4d05c53980533cd399c63c55"

DESCRIPTION="async process"
HOMEPAGE="https://github.com/cxxxr/async-process"
SRC_URI="https://github.com/cxxxr/async-process/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"

src_prepare() {
	default
	eautoreconf
}

src_compile() {
	emake
}

src_install() {
	dolib.so .libs/libasyncprocess.so
	common-lisp-3_src_install
}
