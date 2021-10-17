# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="7320d8688f6ecc9ec5e4a1670cb4060e2bbc5e4c"

DESCRIPTION="ArrayFire's Machine Learning Library"
HOMEPAGE="https://github.com/arrayfire/arrayfire-ml"
SRC_URI="https://github.com/arrayfire/arrayfire-ml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
