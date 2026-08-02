# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python framework for GPU-accelerated simulation, robotics, and ML"
HOMEPAGE="https://github.com/NVIDIA/warp"
SRC_URI="https://github.com/NVIDIA/warp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/warp-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-util/nvidia-cuda-toolkit
"

src_prepare() {
	# Remove -Werror to fix build with newer glibc + Python header macro conflicts
	sed -i "s/-Werror -Wuninitialized/-Wuninitialized/" warp/_src/build_dll.py || die
	distutils-r1_src_prepare
}

src_compile() {
	python build_lib.py \
		--no-standalone \
		--no-use-libmathdx \
		--cuda-path=/opt/cuda \
		--jobs=$(nproc) || die
	distutils-r1_src_compile
}
