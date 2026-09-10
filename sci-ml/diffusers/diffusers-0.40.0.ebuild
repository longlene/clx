# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

DESCRIPTION="State-of-the-art diffusion in PyTorch"
HOMEPAGE="
	https://huggingface.co/docs/diffusers
	https://github.com/huggingface/diffusers
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

# dev-python/httpx is deprecated in Gentoo (profiles/package.deprecated,
# upstream no longer accepts bug reports), but diffusers unconditionally
# imports the httpx module and dev-python/httpx2 is not a drop-in
# replacement (different module name). Keep the dep, accept the
# DeprecatedDep finding.
RDEPEND="
	>=sci-ml/huggingface_hub-1.23.0[${PYTHON_SINGLE_USEDEP}]
	<sci-ml/huggingface_hub-2.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		<dev-python/httpx-1.0.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.8.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest
