# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="072586a71b55b7f8c584153d223e95687148a900"

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
