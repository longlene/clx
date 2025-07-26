# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A portable layout engine targeting web standards"
HOMEPAGE="
	https://yogalayout.dev/
	https://github.com/facebook/yoga
"
SRC_URI="https://github.com/facebook/yoga/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/disable-test.patch
)
