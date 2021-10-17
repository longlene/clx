# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Header only C++14 mocking framework"
HOMEPAGE="https://github.com/rollbear/trompeloeil"
SRC_URI="https://github.com/rollbear/trompeloeil/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins trompeloeil.hpp
	dodoc README.md
}
