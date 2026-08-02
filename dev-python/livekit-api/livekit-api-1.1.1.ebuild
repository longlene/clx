# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python Server API for LiveKit"
HOMEPAGE="https://github.com/livekit/python-sdks"

S="${WORKDIR}/livekit_api-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/types-protobuf-4[${PYTHON_USEDEP}]
	>=dev-python/livekit-protocol-1.1.17[${PYTHON_USEDEP}]
	<dev-python/livekit-protocol-2.0.0[${PYTHON_USEDEP}]
"
