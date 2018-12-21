# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="cdeb59d5c82e5401445b4c051bb396f6738d4a19"

DESCRIPTION="Collective communications library with various primitives for multi-machine training"
HOMEPAGE="https://github.com/facebookincubator/gloo"
SRC_URI="https://github.com/facebookincubator/gloo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
