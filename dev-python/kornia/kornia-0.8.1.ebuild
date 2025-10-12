# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Geometric Computer Vision Library for Spatial AI"
HOMEPAGE="https://github.com/kornia/kornia"
SRC_URI="https://github.com/kornia/kornia/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/kornia-rs-0.1.9[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
