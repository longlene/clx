# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

DESCRIPTION="Yet Another OpenCV eXtension"
HOMEPAGE="https://github.com/sonots/opencvx"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/sonots/opencvx.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include/opencvx
	dosins *.h
	dodoc README.md
}
