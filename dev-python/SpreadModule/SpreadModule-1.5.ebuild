# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python distutils

DESCRIPTION="Python wrapper for Spread"
HOMEPAGE="http://www.zope.org/Members/tim_one/spread/"
SRC_URI="http://www.zope.org/Members/tim_one/spread/${P}/${P}.tgz"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=net-misc/spread-4.0.0"
RDEPEND=""

DOCS="CHANGES MANIFEST PKG-INFO README TODO.txt doc.txt"

src_unpack() {
	unpack "${A}"
	epatch ${FILESDIR}/spreadmodule-for-spread-4.patch || die "patch"
}
