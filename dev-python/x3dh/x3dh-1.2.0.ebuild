# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A Python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
HOMEPAGE="
	https://pypi.org/project/python-x3dh/
	https://github.com/Syndace/python-x3dh/
"
SRC_URI="https://github.com/Syndace/python-x3dh/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/xeddsa-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.3.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-${P}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)
