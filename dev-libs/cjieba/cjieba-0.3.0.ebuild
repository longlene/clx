# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="C API of CppJieba"
HOMEPAGE="https://github.com/yanyiwu/cjieba"
SRC_URI="https://github.com/yanyiwu/cjieba/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-cpp/cppjieba"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins jieba.h
	dolib.a libjieba.a
	dodoc README.md
}
