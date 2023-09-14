# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/yanyiwu/gojieba"

DESCRIPTION="Jieba Chinese Word Segmentation lib written by Go"
HOMEPAGE="https://github.com/yanyiwu/gojieba"
SRC_URI="https://github.com/yanyiwu/gojieba/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="bleve"

DEPEND="
	bleve? ( dev-go/bleve )
"
RDEPEND="${DEPEND}"

src_configure() {
	use bleve && EGO_PN+="/..."
}
