# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Human Preference Score v2 benchmark for text-to-image synthesis"
HOMEPAGE="
	https://github.com/tgxs002/HPSv2
	https://pypi.org/project/hpsv2/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.9.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/timm[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/ftfy[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/braceexpand[${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/webdataset[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/clint[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
