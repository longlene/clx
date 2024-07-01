# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="OCR for latex images"
HOMEPAGE="
	https://github.com/VikParuchuri/texify
	https://pypi.org/project/texify/
"
SRC_URI="https://github.com/VikParuchuri/texify/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/transformers-4.36.2[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.1.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.2[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4.25.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/ftfy-6.1.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
