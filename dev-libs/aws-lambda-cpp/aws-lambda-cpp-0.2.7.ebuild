# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="C++ implementation of the AWS Lambda runtime"
HOMEPAGE="https://github.com/awslabs/aws-lambda-cpp"
SRC_URI="https://github.com/awslabs/aws-lambda-cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND=""
