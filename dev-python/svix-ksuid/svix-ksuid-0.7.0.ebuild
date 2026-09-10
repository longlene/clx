# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A pure-Python KSUID implementation"
HOMEPAGE="https://github.com/svix/python-ksuid"
SRC_URI="https://github.com/svix/python-ksuid/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/python-ksuid-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/python-baseconv[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest
