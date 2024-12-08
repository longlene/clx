# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="7f3f407c7951b54f5c0ed922cf01c01e462a641b"

DESCRIPTION="A Hangul syllable and jamo analyzer"
HOMEPAGE="https://github.com/jdongian/python-jamo"
SRC_URI="https://github.com/jdongian/python-jamo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-jamo-${EGIT_COMMIT}
