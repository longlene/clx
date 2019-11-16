# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="01bbef9b845b2aa855bb5e95f850cddeb62901df"

DESCRIPTION="an implementation of the C++ standard library algorithms with support for execution policies"
HOMEPAGE="https://github.com/intel/parallelstl"
SRC_URI="https://github.com/intel/parallelstl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/tbb
"
RDEPEND="${DEPEND}"
BDEPEND=""
