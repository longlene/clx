# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="A memcached client library for C/C++"
HOMEPAGE="https://github.com/cybozu/libyrmcds"
SRC_URI="https://github.com/cybozu/libyrmcds/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins yrmcds.h
	dolib.a libyrmcds.a
	dodoc README.md
}
