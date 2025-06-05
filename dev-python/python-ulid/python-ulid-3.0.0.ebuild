# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="ULID implementation for Python"
HOMEPAGE="
	https://pypi.org/project/python-ulid/
	https://github.com/mdomke/python-ulid
"
SRC_URI="https://github.com/mdomke/python-ulid/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND+="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
"
RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
