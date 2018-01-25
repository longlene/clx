# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="b3f177dcd2037e44c0e95c6f4b994be9544681f3"

DESCRIPTION="C API of CppJieba"
HOMEPAGE="https://github.com/yanyiwu/cjieba"
SRC_URI="https://github.com/yanyiwu/cjieba/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins lib/jieba.h
	dolib.a libjieba.a
	dodoc README.md
}
