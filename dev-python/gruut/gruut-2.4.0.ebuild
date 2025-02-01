# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="A tokenizer, text cleaner, and phonemizer for many human languages"
HOMEPAGE="
	https://github.com/rhasspy/gruut
	https://pypi.org/project/gruut/
"
SRC_URI="https://github.com/rhasspy/gruut/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/babel-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/dateparser-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/gruut-ipa-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/gruut-lang-en-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonlines-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/num2words-0.5.10[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/python-crfsuite-0.9.7[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	default
	rm -rf tests
	distutils-r1_src_prepare
}
