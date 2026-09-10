# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# Use when upstream name differs from Gentoo PN
MY_P=${PN/-/_}-${PV}

DESCRIPTION=""
HOMEPAGE="https://github.com/OWNER/REPO/"
SRC_URI="https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/some-dep[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
