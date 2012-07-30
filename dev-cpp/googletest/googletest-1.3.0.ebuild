# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Google C++ Testing Framework"
HOMEPAGE="http://code.google.com/p/googletest/wiki/GoogleTestPrimer"
SRC_URI="http://googletest.googlecode.com/files/gtest-${PV}.tar.bz2"

LICENSE="google-code"
SLOT="0"
KEYWORDS="~x86"
IUSE="test"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/gtest-${PV}"

#src_test() {
#	make check fails when run inside the ebuild
#}

