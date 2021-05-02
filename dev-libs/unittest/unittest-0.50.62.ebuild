# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils versionator

MY_P=${PN}-$(replace_version_separator 2 '-')
DESCRIPTION="C++ unit test framework"
HOMEPAGE="http://unittest.red-bean.com"
SRC_URI="http://unittest.red-bean.com/tar/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}/makefile-remove-test.patch"
}

src_install() {
	dodoc docs/* || die "Install failed"

	insinto /usr/include/${PN}
	doins include/* || die "Install failed"

	dolib.a lib/libunittest.a
}

src_test() {
	make test || die "Tests failed"
}
