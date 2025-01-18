# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Text Normalization & Inverse Text Normalization"
HOMEPAGE="
	https://github.com/wenet-e2e/WeTextProcessing
	https://pypi.org/project/WeTextProcessing/
"
SRC_URI="https://github.com/wenet-e2e/WeTextProcessing/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pynini-2.1.6[${PYTHON_USEDEP}]
	dev-python/importlib-resources[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/version-fix.patch
)
