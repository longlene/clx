# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="C++ wrapper for libzip"
HOMEPAGE="https://github.com/ctabin/libzippp"
SRC_URI="https://github.com/ctabin/libzippp/archive/libzippp-v${PV}-1.6.1.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libzip
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_IN_SOURCE_BUILD=ON
