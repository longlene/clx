# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lightweight testing framework for C++."
HOMEPAGE="http://unittest-cpp.sourceforge.net/"

MY_PN="unittest-cpp"
MY_P=${MY_PN}-${PV}
SRC_URI="mirror://sourceforge/unittest-cpp/${MY_P}.zip"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/UnitTest++"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dolib.a libUnitTest++.a

	dodoc docs/UnitTest++.html
	# Example test file
	dodoc src/tests/TestUnitTest++.cpp

	insinto /usr/include/UnitTest++
	doins src/*.h
	insinto /usr/include/UnitTest++/Posix
	doins src/Posix/*.h
}
