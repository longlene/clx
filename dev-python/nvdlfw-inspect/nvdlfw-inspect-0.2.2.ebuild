# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Legacy setup.py (no [project] table) source
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# 0.2.2 exists only on the main branch (no release tag); this is the exact
# "bump version" commit where setup.py carries version 0.2.2.
COMMIT="3a7314ac44f8479a3368a69ac4c7938e40e6104c"

DESCRIPTION="NVIDIA deep learning framework inspection utilities"
HOMEPAGE="
	https://github.com/NVIDIA/nvidia-dlfw-inspect
	https://pypi.org/project/nvdlfw-inspect/
"
SRC_URI="https://codeload.github.com/NVIDIA/nvidia-dlfw-inspect/tar.gz/${COMMIT} -> ${P}-${COMMIT:0:8}.gh.tar.gz"
S="${WORKDIR}/nvidia-dlfw-inspect-${COMMIT:0:40}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# The tree's pytorch uses python-single-r1, so match per target.
# Only 3.13/3.14: the newest tree pytorch ebuild (2.14.1) caps at python 3.14.
RDEPEND="
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		python_targets_python3_13? ( >=sci-ml/pytorch-2.1.0[python_single_target_python3_13] )
		python_targets_python3_14? ( >=sci-ml/pytorch-2.1.0[python_single_target_python3_14] )
	')
"

distutils_enable_tests pytest
