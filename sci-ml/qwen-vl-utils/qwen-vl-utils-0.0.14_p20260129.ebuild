# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="96588727e44c78b25ba03ea03b8e12f7e64fd0da"

DESCRIPTION="Qwen Vision Language Model Utils"
HOMEPAGE="
	https://pypi.org/project/qwen-vl-utils
	https://github.com/QwenLM/Qwen3-VL
"
SRC_URI="https://github.com/QwenLM/Qwen3-VL/archive/${EGIT_COMMIT}.tar.gz -> qwen3-vl-${EGIT_COMMIT}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/Qwen3-VL-${EGIT_COMMIT}/${PN}
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/av[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
#BDEPEND=""
EPYTEST_PLUGINS=()
distutils_enable_tests pytest
