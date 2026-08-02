# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_COMMIT="796f5b53cab69a3d48a44233ce21aae889e94a08"

DESCRIPTION="OpenAI Whisper on Apple silicon with MLX and the Hugging Face Hub"
HOMEPAGE="https://github.com/ml-explore/mlx-examples https://pypi.org/project/mlx-whisper/"
SRC_URI="https://github.com/ml-explore/mlx-examples/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/mlx-examples-${MY_COMMIT}/whisper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/huggingface_hub-0.20[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	media-video/ffmpeg
	$(python_gen_cond_dep '
		>=sci-ml/mlx-0.11[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	')
"
