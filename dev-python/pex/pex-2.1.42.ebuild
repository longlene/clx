# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="A library and tool for generating .pex (Python EXecutable) files"
HOMEPAGE="https://github.com/pantsbuild/pex"
SRC_URI="https://github.com/pantsbuild/pex/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
