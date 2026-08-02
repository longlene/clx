# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The tea module of alibabaCloud Python SDK"
HOMEPAGE="https://github.com/aliyun/tea-python"
SRC_URI="https://files.pythonhosted.org/packages/9a/7d/b22cb9a0d4f396ee0f3f9d7f26b76b9ed93d4101add7867a2c87ed2534f5/alibabacloud-tea-${PV}.tar.gz -> ${P}.pypi.tar.gz"

S="${WORKDIR}/${P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.7.0[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
"
