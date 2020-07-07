# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Avro C implementation"
HOMEPAGE="http://www.apache.org/dyn/closer.cgi/avro/"
SRC_URI="mirror://apache/avro/avro-${PV}/c/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	app-arch/lzma
	app-arch/snappy
	dev-libs/jansson
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "s#DESTINATION lib#DESTINATION $(get_libdir)#" src/CMakeLists.txt
}
