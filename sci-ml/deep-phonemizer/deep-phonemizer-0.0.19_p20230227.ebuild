# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="5dce7e27556aef4426f5623baf6351d266a30a73"

DESCRIPTION="Grapheme to phoneme conversion with deep learning"
HOMEPAGE="https://github.com/as-ideas/DeepPhonemizer"
SRC_URI="https://github.com/as-ideas/DeepPhonemizer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/pytorch-1.2.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tqdm-4.38.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
		>=dev-python/certifi-2022.12.7[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

S="${WORKDIR}"/DeepPhonemizer-${EGIT_COMMIT}
