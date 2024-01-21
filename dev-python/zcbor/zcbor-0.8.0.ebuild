# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Code generation from CDDL descriptions"
HOMEPAGE="https://github.com/NordicSemiconductor/zcbor"
SRC_URI="https://github.com/NordicSemiconductor/zcbor/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cbor2-5.4.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/regex-2022.3.15[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

