# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Pathfinder for CUDA components"
HOMEPAGE="
	https://pypi.org/project/cuda-pathfinder/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/cuda-pathfinder-v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/cuda-python-cuda-pathfinder-v${PV}/cuda_pathfinder

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-util/nvidia-cuda-toolkit
"
BDEPEND="
	dev-python/setuptools-scm
	>=dev-python/setuptools-80
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	# setuptools-scm versions from the monorepo root (root = ".."), which is
	# not a git checkout in the tag tarball
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}
