# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Lance Namespace workspace with all Python packages"
HOMEPAGE="
	https://pypi.org/project/lance-namespace/
	https://github.com/lance-format/lance-namespace
"
SRC_URI="https://github.com/lance-format/lance-namespace/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${P}/python/lance_namespace
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
