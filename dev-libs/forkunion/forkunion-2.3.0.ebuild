# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Lower-latency OpenMP-style minimalistic scoped thread-pool"
HOMEPAGE="https://github.com/ashvardanian/ForkUnion"
SRC_URI="https://github.com/ashvardanian/ForkUnion/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/ForkUnion-${PV}
