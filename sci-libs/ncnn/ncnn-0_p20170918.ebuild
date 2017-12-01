# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="f8dc80f756108c24ccb597181de7232cee4d310f"

DESCRIPTION="ncnn is a high-performance neural network inference framework optimized for the mobile platform"
HOMEPAGE="https://github.com/Tencent/ncnn"
SRC_URI="https://github.com/Tencent/ncnn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
