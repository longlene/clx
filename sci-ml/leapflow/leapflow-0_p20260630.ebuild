# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

COMMIT="e4072f56ff9145394440e37acdac7b0aa716b4d3"

DESCRIPTION="Learning and Evolving from Actual Practice — macOS automation agent"
HOMEPAGE="https://github.com/modelscope/leapflow"
SRC_URI="https://github.com/modelscope/leapflow/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/openai-1.40[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.8[${PYTHON_USEDEP}]
	>=dev-python/duckdb-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0[${PYTHON_USEDEP}]
"
