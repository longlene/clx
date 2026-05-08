# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="nemo-retriever"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python module with core document ingestion functions"
HOMEPAGE="
	https://github.com/NVIDIA/NeMo-Retriever
"
SRC_URI="https://github.com/NVIDIA/NeMo-Retriever/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2025.5.1[${PYTHON_USEDEP}]
	>=dev-python/universal-pathlib-0.2.6[${PYTHON_USEDEP}]
	>=dev-python/ffmpeg-python-0.2.0[${PYTHON_USEDEP}]
	dev-python/tritonclient[${PYTHON_USEDEP}]
	dev-python/glom[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4.30.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/NeMo-Retriever-${PV}/api
