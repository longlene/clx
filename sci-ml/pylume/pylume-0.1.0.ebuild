# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Part of the trycua/cua monorepo (tag v0.1.13, library at libs/pylume).
# All libraries in the monorepo carry version 0.1.0; the tag is the
# de-facto release version.
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{9..15} )

inherit distutils-r1

DESCRIPTION="Python SDK for the lume macOS/Linux VM runner"
HOMEPAGE="https://github.com/trycua/cua"
MY_PV=0.1.13

SRC_URI="https://github.com/trycua/cua/archive/refs/tags/v${MY_PV}.tar.gz -> cua-${MY_PV}.gh.tar.gz"
S="${WORKDIR}/cua-${MY_PV}/libs/pylume"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=( pytest )

distutils_enable_tests pytest
