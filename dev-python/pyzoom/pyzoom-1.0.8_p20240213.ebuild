# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

EGIT_COMMIT="b884e210e7b5f583c92600384c1f3823632a166f"

DESCRIPTION="Python wrapper for Zoom Video API with an OAUTH Wizard"
HOMEPAGE="https://github.com/licht1stein/pyzoom"
SRC_URI="https://github.com/licht1stein/pyzoom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.1[${PYTHON_USEDEP}]
	>=dev-python/shortuuid-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.4.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-7.1[${PYTHON_USEDEP}]
		>=dev-python/black-22.6[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-0.21.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

