# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C99 library implementation for communicating with the S3 service"
HOMEPAGE="https://github.com/awslabs/aws-c-s3"
SRC_URI="https://github.com/awslabs/aws-c-s3/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/aws-c-auth
"
RDEPEND="${DEPEND}"
BDEPEND=""
