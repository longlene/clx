# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python SDK distribution for NeMo Fabric"
HOMEPAGE="
	https://pypi.org/project/nemo-fabric/
	https://github.com/NVIDIA/NeMo-Fabric
"
SRC_URI="https://github.com/NVIDIA/NeMo-Fabric/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/NeMo-Fabric-${PV}/sdk/python/nemo-fabric

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~dev-python/nemo-fabric-runtime-${PV}[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-77[${PYTHON_USEDEP}]
"

# The meta package ships no modules (packages = []); distutils-r1 still
# expects an installed distribution to exist, so build the wheel normally.
RESTRICT="test"
