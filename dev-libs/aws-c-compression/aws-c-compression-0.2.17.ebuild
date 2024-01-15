# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C99 implementation of huffman encoding/decoding"
HOMEPAGE="https://github.com/awslabs/aws-c-compression"
SRC_URI="https://github.com/awslabs/aws-c-compression/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/aws-c-common
"
RDEPEND="${DEPEND}"
BDEPEND=""
