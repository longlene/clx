# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The Python implementation of Connect: Protobuf RPC that works"
HOMEPAGE="
	https://pypi.org/project/connect-python/
	https://github.com/connectrpc/connect-python
"
SRC_URI="https://github.com/connectrpc/connect-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/protobuf-5.28.0[${PYTHON_USEDEP}]
	>=dev-python/pyqwest-0.5.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
