# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Modal-style sandbox API on top of Hugging Face Jobs"
HOMEPAGE="https://github.com/huggingface/hf-sandbox"
SRC_URI="https://github.com/huggingface/hf-sandbox/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

# no license file or declaration upstream
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE="server"
RESTRICT="mirror"

RDEPEND="
	>=sci-ml/huggingface_hub-1.19[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/httpx[${PYTHON_USEDEP}]
		server? (
			dev-python/fastapi[${PYTHON_USEDEP}]
			dev-python/uvicorn[${PYTHON_USEDEP}]
		)
	')
"
