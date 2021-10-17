# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mozillazg/go-pinyin/..."

DESCRIPTION="汉语拼音转换工具"
HOMEPAGE="https://github.com/mozillazg/go-pinyin"
SRC_URI="https://github.com/mozillazg/go-pinyin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/pinyin
	dodoc src/${EGO_PN%/*}/README.md
}
