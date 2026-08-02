# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python protocol stubs for LiveKit"
HOMEPAGE="https://github.com/livekit/python-sdks"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/protobuf-4[${PYTHON_USEDEP}]
	>=dev-python/types-protobuf-4[${PYTHON_USEDEP}]
"
