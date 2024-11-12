# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Fast inference engine for Transformer models"
HOMEPAGE="https://gitter.im/OpenNMT/CTranslate2"
SRC_URI="https://github.com/OpenNMT/CTranslate2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
"
BDEPEND="dev-libs/ctranslate2"

distutils_enable_tests pytest

S="${WORKDIR}"/CTranslate2-${PV}/python
