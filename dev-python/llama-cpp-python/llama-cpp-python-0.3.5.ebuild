# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Python bindings for the llama.cpp library"
HOMEPAGE="https://github.com/abetlen/llama-cpp-python"
SRC_URI="
	https://github.com/abetlen/llama-cpp-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-misc/llama-cpp
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/diskcache-5.6.1[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.11.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

export CMAKE_ARGS="-DLLAMA_BUILD=OFF -DLLAVA_BUILD=OFF"
