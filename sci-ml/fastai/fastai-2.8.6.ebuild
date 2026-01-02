# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="The fastai deep learning library"
HOMEPAGE="http://docs.fast.ai/"
SRC_URI="https://github.com/fastai/fastai/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/torchvision-0.11[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastdownload-0.0.5[${PYTHON_USEDEP}]
		>=dev-python/fastcore-1.8.0[${PYTHON_USEDEP}]
		>=dev-python/fasttransform-0.0.2[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/fastprogress-0.2.4[${PYTHON_USEDEP}]
		>=dev-python/pillow-9.0.0[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/spacy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/plum-dispatch[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
	')
"
BDEPEND=""
