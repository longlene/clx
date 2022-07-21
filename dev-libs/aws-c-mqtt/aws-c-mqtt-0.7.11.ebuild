# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C99 implementation of the MQTT 3.1.1 specification"
HOMEPAGE="https://github.com/awslabs/aws-c-mqtt"
SRC_URI="https://github.com/awslabs/aws-c-mqtt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/aws-c-http
	dev-libs/aws-c-io
"
RDEPEND="${DEPEND}"
BDEPEND=""
