# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="C++11 JSON parser and writer"
HOMEPAGE="http://rapptz.github.com/jsonpp"
SRC_URI="https://github.com/Rapptz/jsonpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r jsonpp.hpp jsonpp
}
