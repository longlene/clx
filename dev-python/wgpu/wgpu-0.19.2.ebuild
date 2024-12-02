# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="WebGPU for Python"
HOMEPAGE="
	https://github.com/pygfx/wgpu-py
"
SRC_URI="https://github.com/pygfx/wgpu-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cffi-1.15.0[${PYTHON_USEDEP}]
	dev-libs/wgpu-native
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-py-${PV}
