# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Video++, a C++14 high performance video and image processing library"
HOMEPAGE="http://documentup.com/matt-42/vpp"
SRC_URI="https://github.com/matt-42/vpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/eigen:3
	dev-cpp/iod
"

src_install() {
	insinto /usr/include
	doins -r vpp
	dodoc README.md
}
