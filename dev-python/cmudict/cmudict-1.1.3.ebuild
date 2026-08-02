# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A versioned python wrapper package for The CMU Pronouncing Dictionary data files"
HOMEPAGE="https://github.com/prosegrinder/python-cmudict"
SRC_URI="https://github.com/prosegrinder/python-cmudict/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/python-cmudict-${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	dev-python/importlib-resources[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
