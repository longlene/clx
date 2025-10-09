# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Python module for audio and music processing"
HOMEPAGE="https://librosa.org/"
SRC_URI="https://github.com/librosa/librosa/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/audioread-2.1.9[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20.3[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/joblib-0.14[${PYTHON_USEDEP}]
	>=dev-python/decorator-4.3.0[${PYTHON_USEDEP}]
	>=dev-python/numba-0.51.0[${PYTHON_USEDEP}]
	>=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/pooch-1.0[${PYTHON_USEDEP}]
	>=dev-python/soxr-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1.1[${PYTHON_USEDEP}]
	>=dev-python/lazy-loader-0.1[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-mpl[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
