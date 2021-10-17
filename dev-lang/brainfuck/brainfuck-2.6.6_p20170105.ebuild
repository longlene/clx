# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="bf21305fd06bf1f65a1d3d5c7800f9f2efe4891c"

DESCRIPTION="Brainfuck interpreter written in C"
HOMEPAGE="https://github.com/fabianishere/brainfuck"
SRC_URI="https://github.com/fabianishere/brainfuck/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins include/brainfuck.h
	doman man/brainfuck.1
	dolib.a ${BUILD_DIR}/libbrainfuck.a
	dobin ${BUILD_DIR}/brainfuck
	dodoc README.markdown
}
