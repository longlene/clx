# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Static memory-efficient Trie-like structures for Python based on marisa-trie"
HOMEPAGE="https://github.com/pytries/marisa-trie/"
SRC_URI="
	https://github.com/pytries/marisa-trie/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/s-yata/marisa-trie/archive/80bc7aa13d024053eeb3e7565df28c95b8b9090d.tar.gz -> marisa-trie-80bc7aa13d024053eeb3e7565df28c95b8b9090d.tar.gz
"

LICENSE="MIT || ( BSD-2 LGPL-2.1+ )"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	default
	rmdir marisa-trie && ln -sv "${WORKDIR}"/marisa-trie-80bc7aa13d024053eeb3e7565df28c95b8b9090d marisa-trie
	distutils-r1_src_prepare
}
