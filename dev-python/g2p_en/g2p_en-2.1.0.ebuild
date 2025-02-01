# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="A Simple Python Module for English Grapheme To Phoneme Conversion"
HOMEPAGE="
	https://pypi.org/project/g2p_en/
	https://github.com/Kyubyong/g2p
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.13.1[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.2.4[${PYTHON_USEDEP}]
	>=dev-python/inflect-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/distance-0.1.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
