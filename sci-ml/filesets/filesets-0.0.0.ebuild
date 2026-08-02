# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="0.1.3-rc0"

DESCRIPTION="File set abstractions for the NeMo Platform"
HOMEPAGE="https://github.com/NVIDIA-NeMo/nemo-platform"
SRC_URI="https://github.com/NVIDIA-NeMo/nemo-platform/archive/refs/tags/${MY_PV}.tar.gz -> nemo-platform-0.1.3_rc0.gh.tar.gz"

S="${WORKDIR}/nemo-platform-${MY_PV}/packages/filesets"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.1.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"
RESTRICT="test"
