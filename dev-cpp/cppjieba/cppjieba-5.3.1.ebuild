# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Jieba Chinese Word Segmentation Implemented By C++"
HOMEPAGE="https://github.com/yanyiwu/cppjieba/"
SRC_URI="https://github.com/yanyiwu/cppjieba/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	doheader -r include/cppjieba
	insinto /usr/share/jieba/dict
	doins dict/*.utf8
	dodoc -r README.md
}
