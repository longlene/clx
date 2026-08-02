# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Streaming parser for multipart/form-data"
HOMEPAGE="https://github.com/siddhantgoel/streaming-form-data https://pypi.org/project/streaming-form-data/"
SRC_URI="https://github.com/siddhantgoel/streaming-form-data/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/smart-open[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/moto[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-asyncio )

distutils_enable_tests pytest
