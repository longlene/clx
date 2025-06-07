# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A tool to remove images background"
HOMEPAGE="https://github.com/danielgatis/rembg"
SRC_URI="https://github.com/danielgatis/rembg/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pooch[${PYTHON_USEDEP}]
		dev-python/pymatting[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		media-libs/opencv[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
