# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Pathlib API extended to use fsspec backends"
HOMEPAGE="
	https://pypi.org/project/universal-pathlib/
	https://github.com/fsspec/universal_pathlib
"
SRC_URI="https://github.com/fsspec/universal_pathlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/fsspec-2024.5.0[${PYTHON_USEDEP}]
	>=dev-python/pathlib-abc-0.5.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/universal_pathlib-${PV}

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_UNIVERSAL_PATHLIB="${PV}"
