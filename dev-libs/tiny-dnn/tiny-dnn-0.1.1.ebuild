# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="header only, dependency-free deep learning framework in C++11"
HOMEPAGE="https://github.com/tiny-dnn/tiny-dnn"
SRC_URI="https://github.com/tiny-dnn/tiny-dnn/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r tiny_cnn
	dodoc README.md
}
