# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Portable, simple and extensible C++ logging library"
HOMEPAGE="https://github.com/SergiusTheBest/plog"
SRC_URI="https://github.com/SergiusTheBest/plog/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/plog
	dodoc README.md
}
