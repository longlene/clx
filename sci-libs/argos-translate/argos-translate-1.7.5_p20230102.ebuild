# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9,10,11})
inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="000aecda6fc927250a1b477186aae5812fd827d0"

DESCRIPTION="Open-source offline translation library written in Python"
HOMEPAGE="https://www.argosopentech.com/"
SRC_URI="https://github.com/argosopentech/argos-translate/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/ctranslate2-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/senencepiece-0.1.96[${PYTHON_USEDEP}]
	>=dev-python/stanza-1.1.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/mypy[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_prepare() {
	default
	rm -rf tests
	distutils-r1_src_prepare
}
