# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="cutlass"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="NVIDIA CUTLASS Python DSL"
HOMEPAGE="
	https://pypi.org/project/nvidia-cutlass-dsl/
	https://github.com/NVIDIA/cutlass/
"
SRC_URI="https://github.com/NVIDIA/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
S="${WORKDIR}"/${MY_P}/python/CuTeDSL
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
