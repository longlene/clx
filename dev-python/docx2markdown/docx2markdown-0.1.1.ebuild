# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python utility to convert simple docx files to markdown and back"
HOMEPAGE="
	https://pypi.org/project/docx2markdown/
	https://github.com/haesleinhuepf/docx2markdown/
"
SRC_URI="https://github.com/haesleinhuepf/docx2markdown/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/python-docx[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
