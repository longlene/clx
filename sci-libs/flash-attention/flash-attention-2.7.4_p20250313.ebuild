# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="000090d02f0398e9087a8823fc1f5242becfac99"

DESCRIPTION="Fast and memory-efficient exact attention"
HOMEPAGE="https://github.com/Dao-AILab/flash-attention"
SRC_URI="https://github.com/Dao-AILab/flash-attention/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

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
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/einops[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

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
