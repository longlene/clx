# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot autotools

EGIT_COMMIT="3b16b91d417530dac03559980fb5703206e20c55"

DESCRIPTION="async process"
HOMEPAGE="https://github.com/lem-project/async-process"
SRC_URI="https://github.com/lem-project/async-process/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
