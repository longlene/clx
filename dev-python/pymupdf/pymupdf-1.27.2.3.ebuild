# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A high performance Python library for data extraction, analysis, conversion"
HOMEPAGE="
	https://pypi.org/project/pymupdf/
	https://github.com/pymupdf/PyMuPDF/
"
SRC_URI="https://github.com/pymupdf/PyMuPDF/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}"/PyMuPDF-${PV}

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-text/mupdf
"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export PYMUPDF_SETUP_MUPDF_BUILD=""

src_prepare() {
	default
	rm pyproject.toml
	distutils-r1_src_prepare
}
