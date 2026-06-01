# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

DESCRIPTION="Generate stubs for python modules"
HOMEPAGE="https://github.com/sizmailov/pybind11-stubgen"
SRC_URI="https://github.com/sizmailov/pybind11-stubgen/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
