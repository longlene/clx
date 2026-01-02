# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic vcs-snapshot
#inherit flag-o-matic vcs-snapshot

EGIT_COMMIT="9292363350498c718996a404bbf64c98543c980a"

DESCRIPTION="Turbo Base64"
HOMEPAGE="https://github.com/powturbo/Turbo-Base64"
SRC_URI="https://github.com/powturbo/Turbo-Base64/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	filter-flags -march=* -mtune=*
	cmake_src_configure
}

