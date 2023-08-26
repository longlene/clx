# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A collection of C++ HTTP libraries including an easy to use HTTP server"
HOMEPAGE="https://github.com/facebook/proxygen"
SRC_URI="https://github.com/facebook/proxygen/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/libfmt
	dev-cpp/folly
	dev-cpp/wangle
"
RDEPEND="${DEPEND}"
BDEPEND=""
