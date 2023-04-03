# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C99 library implementation of AWS client-side authentication: standard credentials providers and signing"
HOMEPAGE="https://github.com/awslabs/aws-c-auth"
SRC_URI="https://github.com/awslabs/aws-c-auth/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/s2n
	dev-libs/aws-c-http
	dev-libs/aws-c-cal
"
RDEPEND="${DEPEND}"
BDEPEND=""
