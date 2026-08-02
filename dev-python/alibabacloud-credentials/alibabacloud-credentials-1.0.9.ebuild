# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Alibaba Cloud credentials library for Python"
HOMEPAGE="https://github.com/aliyun/credentials-python"
SRC_URI="https://github.com/aliyun/credentials-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/credentials-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiofiles-22.1.0[${PYTHON_USEDEP}]
	>=dev-python/apscheduler-3.10.0[${PYTHON_USEDEP}]
	<dev-python/apscheduler-4[${PYTHON_USEDEP}]
	>=dev-python/alibabacloud-tea-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/alibabacloud-credentials-api-1.0.0[${PYTHON_USEDEP}]
	<dev-python/alibabacloud-credentials-api-2.0.0[${PYTHON_USEDEP}]
"
