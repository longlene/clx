# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ wrapper around libcURL"
HOMEPAGE="http://www.curlpp.org/"
SRC_URI="https://github.com/jpbarrette/curlpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#-L@libdir@##' \
		-e 's#@LDFLAGS@\ @LIBS@##' \
		-e 's#-I@includedir@##' \
		-i extras/curlpp.pc.in
}
