# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Cross-Platform HW accelerated CRC32c and CRC32 with fallback to efficient SW implementations"
HOMEPAGE="https://github.com/awslabs/aws-checksums"
SRC_URI="https://github.com/awslabs/aws-checksums/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/aws-c-common
"
BDEPEND=""
