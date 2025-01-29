# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="a24d6012d396d035a86c4f85e1a6395cfe62250b"

DESCRIPTION=""
HOMEPAGE="https://github.com/fakerybakery/simpletts"
SRC_URI="https://github.com/fakerybakery/simpletts/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-libs/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-libs/torchaudio[${PYTHON_SINGLE_USEDEP}]
	sci-libs/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-libs/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-libs/openphonemizer[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/cached-path[${PYTHON_USEDEP}]
		dev-python/pydub[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/txtsplit[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
