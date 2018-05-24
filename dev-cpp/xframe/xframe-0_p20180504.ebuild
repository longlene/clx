# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="e2896b6fccccdb8c170c898d5218d3d25378836f"

DESCRIPTION="C++ dataframe"
HOMEPAGE="https://github.com/QuantStack/xframe"
SRC_URI="https://github.com/QuantStack/xframe/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/xtensor
	dev-cpp/xtl
"
RDEPEND="${DEPEND}"
