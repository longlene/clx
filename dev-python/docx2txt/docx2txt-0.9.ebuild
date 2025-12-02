# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A pure python based utility to extract text and images from docx files"
HOMEPAGE="
	https://pypi.org/project/docx2txt/
	https://github.com/ankushshah89/python-docx2txt
"
SRC_URI="https://github.com/ankushshah89/python-docx2txt/archive/refs/tags/${PV}.tar.gz -> python-${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-${P}
