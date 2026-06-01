# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A third-party Gradio component library with Ant Design and Monaco Editor"
HOMEPAGE="https://github.com/modelscope/modelscope-studio"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND=">=dev-python/gradio-6.0[${PYTHON_SINGLE_USEDEP}]"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatch-requirements-txt[${PYTHON_USEDEP}]
		>=dev-python/hatch-fancy-pypi-readme-22.5.0[${PYTHON_USEDEP}]
	')
"
