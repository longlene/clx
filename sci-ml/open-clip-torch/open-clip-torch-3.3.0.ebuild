# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Open reproduction of CLIP (contrastive language-image pretraining)"
HOMEPAGE="
	https://github.com/mlfoundations/open_clip
	https://pypi.org/project/open-clip-torch/
"
SRC_URI="https://github.com/mlfoundations/open_clip/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/open_clip-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="training"

RDEPEND="
	>=sci-ml/pytorch-2.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/timm-1.0.17[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/ftfy[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		training? (
			dev-python/fsspec[${PYTHON_USEDEP}]
			dev-python/pandas[${PYTHON_USEDEP}]
			>=dev-python/webdataset-0.2.5[${PYTHON_USEDEP}]
			dev-python/transformers[${PYTHON_USEDEP}]
		)
	')
"
DEPEND="${RDEPEND}"

RESTRICT="test"
