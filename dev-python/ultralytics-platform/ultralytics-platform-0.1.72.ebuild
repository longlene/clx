# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Typed Python SDK for the Ultralytics Platform API"
HOMEPAGE="
	https://github.com/ultralytics/sdk
	https://pypi.org/project/ultralytics-platform/
"
SRC_URI="https://github.com/ultralytics/sdk/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/sdk-${PV}/sdk/python"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
# tests live outside the package dir and exercise the live API
RESTRICT="test"

RDEPEND="
	>=dev-python/httpx-0.28[${PYTHON_USEDEP}]
	<dev-python/httpx-1[${PYTHON_USEDEP}]
"
