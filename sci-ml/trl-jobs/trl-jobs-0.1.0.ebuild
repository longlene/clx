# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Train LLM on Hugging Face infra"
HOMEPAGE="https://github.com/huggingface/trl-jobs"
SRC_URI="https://github.com/huggingface/trl-jobs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.34.4[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
