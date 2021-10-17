# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="Avro C++ implementations"
HOMEPAGE="http://www.apache.org/dyn/closer.cgi/avro"
SRC_URI="mirror://apache/avro/avro-${PV}/cpp/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/enable_testing/d' \
		-e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i CMakeLists.txt
}
