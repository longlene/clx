# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python binding for MeCab"
HOMEPAGE="
	https://github.com/SamuraiT/mecab-python3
	https://pypi.org/project/mecab-python3/
"
#SRC_URI="https://github.com/SamuraiT/mecab-python3/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
SRC_URI="$(pypi_sdist_url --no-normalize 'mecab_python3' ${PV})"

LICENSE="BSD"
SLOT="3"
KEYWORDS="~amd64"

DEPEND="app-text/mecab"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/mecab_python3-${PV}

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_MECAB_PYTHON3=${PV}
