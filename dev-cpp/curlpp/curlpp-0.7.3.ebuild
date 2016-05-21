# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

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
	sed -i '/examples/d' configure.ac
	sed -i '/SUBDIRS/{s/examples//}' Makefile.am
	eautoreconf
}
