# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

FLEXOLMO_COMMIT="65e9b46b43ecb6ae66995b9d97b375c4b4dfd70c"

DESCRIPTION="Code and training scripts for FlexOlmo language models"
HOMEPAGE="https://github.com/allenai/FlexOlmo"
SRC_URI="https://github.com/allenai/FlexOlmo/archive/${FLEXOLMO_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/FlexOlmo-${FLEXOLMO_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.7.0[${PYTHON_SINGLE_USEDEP}]
	dev-python/cached-path[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/importlib-resources[${PYTHON_USEDEP}]
		sci-ml/ring-flash-attn[${PYTHON_USEDEP}]
	')
"
