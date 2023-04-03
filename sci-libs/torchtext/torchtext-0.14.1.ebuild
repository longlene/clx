# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="Models, data loaders and abstractions for language processing"
HOMEPAGE="https://pytorch.org/text"
SRC_URI="https://github.com/pytorch/text/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/pytorch[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

S="${WORKDIR}"/text-${PV}
