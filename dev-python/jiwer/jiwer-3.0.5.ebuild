# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Evaluate your speech-to-text system with similarity measures such as word error rate"
HOMEPAGE="
	https://github.com/jitsi/jiwer
	https://pypi.org/project/jiwer/
"
SRC_URI="https://github.com/jitsi/jiwer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/rapidfuzz-3[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-benchmark-3.4.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
