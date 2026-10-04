# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Legacy setup.py (no pyproject.toml) source
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# Polygraphy is a subdirectory of the NVIDIA/TensorRT monorepo (the last
# 10.x release tree carrying its setup.py). The tree's dev-python/tensorrt
# is 10.x, so build the matching 0.49.27 from TensorRT v10.16.
TRT_V="10.16"

DESCRIPTION="Polygraphy: a deep learning inference prototyping and debugging toolkit"
HOMEPAGE="
	https://github.com/NVIDIA/TensorRT/tree/v10.16/tools/Polygraphy
	https://pypi.org/project/polygraphy/
"
SRC_URI="https://github.com/NVIDIA/TensorRT/archive/refs/tags/v${TRT_V}.tar.gz -> TensorRT-v${TRT_V}.gh.tar.gz"
S="${WORKDIR}/TensorRT-${TRT_V}/tools/Polygraphy"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/tensorrt[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
