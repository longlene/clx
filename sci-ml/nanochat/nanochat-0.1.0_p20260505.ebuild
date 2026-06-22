# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="dc54a1a3077cab11d68fac4c5d1cd5c51f5d8c7a"

DESCRIPTION="The minimal full-stack ChatGPT clone"
HOMEPAGE="
	https://github.com/karpathy/nanochat
"
SRC_URI="
	https://github.com/karpathy/nanochat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/kernels-0.11.7[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.9.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.22.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.117.1[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/rustbpe-0.1.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.11.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.36.0[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.21.3[${PYTHON_USEDEP}]
	')
"
BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools[${PYTHON_USEDEP}]')"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	# upstream pyproject.toml omits [build-system]; inject it for PEP 517
	# also restrict package discovery to avoid picking up dev/ and runs/
	cat >> pyproject.toml <<-EOF || die

		[build-system]
		requires = ["setuptools>=68.0"]
		build-backend = "setuptools.build_meta"

		[tool.setuptools.packages.find]
		include = ["nanochat*"]
	EOF
	distutils-r1_src_prepare
}
