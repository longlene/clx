# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="An open-source toolkit for optimizing and deploying AI inference"
HOMEPAGE="https://docs.openvino.ai/"
SRC_URI="
	https://github.com/openvinotoolkit/openvino/archive/refs/tags/${PV}.tar.gz -> openvino-${PV}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sci-libs/omz-tools[${PYTHON_SINGLE_USEDEP}]
	sci-libs/openvino[${PYTHON_SINGLE_USEDEP}]
	sci-libs/openvino-mo[${PYTHON_SINGLE_USEDEP}]
"
RDEPEND="
	${DEPEND}
"
BDEPEND=""
RESTRICT="test"

S="${WORKDIR}"/openvino-${PV}/tools/openvino_dev

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
