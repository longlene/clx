# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Fast and memory-efficient exact attention"
HOMEPAGE="https://github.com/Dao-AILab/flash-attention"
SRC_URI="https://github.com/Dao-AILab/flash-attention/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm"
REQUIRED_USE="|| ( cuda rocm )"

DEPEND="
	cuda? (
		dev-util/nvidia-cuda-toolkit
		dev-libs/cutlass
	)
	rocm? ( dev-util/hip )
"
RDEPEND="${DEPEND}
	dev-python/einops[${PYTHON_USEDEP}]
	sci-ml/pytorch[${PYTHON_USEDEP}]
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/setup-fix.patch
)

src_compile() {
	local target
	if use cuda ; then
		target="cuda"
	elif use rocm ; then
		target="rocm"
	fi
	export BUILD_TARGET=${target}
	distutils-r1_src_compile
}
