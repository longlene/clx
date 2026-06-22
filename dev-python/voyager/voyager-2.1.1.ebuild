# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Easy-to-use, fast, simple multi-platform approximate nearest-neighbor search"
HOMEPAGE="
	https://pypi.org/project/voyager/
	https://github.com/spotify/voyager
"
SRC_URI="https://github.com/spotify/voyager/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${S}"/python
KEYWORDS="~amd64"

BDEPEND="
	dev-python/nanobind[${PYTHON_USEDEP}]
"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
