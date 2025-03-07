# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Convert Word documents from docx to simple and clean HTML and Markdown"
HOMEPAGE="
	https://pypi.org/project/mammoth/
	https://github.com/mwilliamson/python-mammoth
"
SRC_URI="https://github.com/mwilliamson/python-mammoth/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cobble-0.1.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-${P}

src_prepare() {
	default
	sed -e 's#"README"#"README.md"#' \
		-i setup.py
	distutils-r1_src_prepare
}
