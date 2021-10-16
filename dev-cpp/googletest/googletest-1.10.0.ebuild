# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="Google C++ Testing Framework"
HOMEPAGE="http://code.google.com/p/googletest/wiki/GoogleTestPrimer"
SRC_URI="https://github.com/google/googletest/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="test"

DEPEND=""
RDEPEND=""

