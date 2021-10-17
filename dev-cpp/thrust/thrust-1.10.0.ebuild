# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Thrust is a parallel algorithms library which resembles the C++ Standard Template Library"
HOMEPAGE="http://thrust.github.com/"
SRC_URI="https://github.com/thrust/thrust/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r thrust
	dodoc README.md
	use example || dodoc -r examples
}
