# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="90a938f30ba414ada2f4b00674ee9631d7d85e19"

DESCRIPTION="Portable 128-bit SIMD intrinsics"
HOMEPAGE="https://github.com/Maratyszcza/psimd"
SRC_URI="https://github.com/Maratyszcza/psimd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
