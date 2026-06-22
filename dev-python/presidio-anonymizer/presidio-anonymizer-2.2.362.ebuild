# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Replaces detected PII text entities with desired values"
HOMEPAGE="https://github.com/microsoft/presidio"
SRC_URI="https://github.com/microsoft/presidio/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/presidio-${PV}/presidio-anonymizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/cryptography-46.0.4[${PYTHON_USEDEP}]
')"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/python-dotenv[${PYTHON_USEDEP}]
		')
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
