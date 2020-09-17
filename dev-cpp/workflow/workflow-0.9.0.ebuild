# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Sogou framework for C++ backend development"
HOMEPAGE="https://github.com/sogou/workflow"
SRC_URI="https://github.com/sogou/workflow/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""
