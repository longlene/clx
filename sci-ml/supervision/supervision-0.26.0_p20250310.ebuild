# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="c9a30692979614bb83eef4b075b3cd6344b1d0e6"

DESCRIPTION="A set of easy-to-use utils that will come in handy in any Computer Vision project"
HOMEPAGE="https://github.com/roboflow/supervision"
SRC_URI="https://github.com/roboflow/supervision/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.21.2[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.62.3[${PYTHON_USEDEP}]
	media-libs/opencv[python,${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
