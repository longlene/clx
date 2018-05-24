# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

EGIT_COMMIT="2018.04.02.00"

DESCRIPTION="C++ networking library"
HOMEPAGE="https://github.com/facebook/wangle"
SRC_URI="https://github.com/facebook/wangle/archive/v${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-cpp/folly"
RDEPEND="${DEPEND}"
