# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Static memory-efficient Trie-like structures for Python based on marisa-trie C++ library"
HOMEPAGE="https://github.com/pytries/marisa-trie/"
SRC_URI="
	https://github.com/pytries/marisa-trie/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/s-yata/marisa-trie/archive/e54f296bb52d16693931c8b963744931ef1e37f7.tar.gz -> marisa-trie-e54f296bb52d16693931c8b963744931ef1e37f7.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	default
	rmdir marisa-trie && ln -sv "${WORKDIR}"/marisa-trie-e54f296bb52d16693931c8b963744931ef1e37f7 marisa-trie
	distutils-r1_src_prepare
}
