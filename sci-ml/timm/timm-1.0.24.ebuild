# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="PyTorch Image Models"
HOMEPAGE="https://pypi.org/project/timm/"
SRC_URI="https://github.com/huggingface/pytorch-image-models/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.17.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/pytorch-image-models-${PV}

