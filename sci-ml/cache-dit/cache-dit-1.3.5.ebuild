# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A PyTorch-native inference engine with cache, parallelism, quantization for Diffusion Transformers"
HOMEPAGE="
	https://pypi.org/project/cache-dit/
	https://github.com/vipshop/cache-dit
"
SRC_URI="https://github.com/vipshop/cache-dit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	')
	>=sci-ml/pytorch-2.7.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/diffusers-0.36.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.55.2[${PYTHON_SINGLE_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CACHE_DIT="${PV}"
