# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="C++ client for making HTTP/REST requests"
HOMEPAGE="http://code.mrtazz.com/restclient-cpp/"
SRC_URI="https://github.com/mrtazz/restclient-cpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
