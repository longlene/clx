# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

HAT_TRIE_COMMIT="906e6abd1e7063f1dacd3a6b270aa654b525eb0a"

DESCRIPTION="A Fast and Memory-Efficient HAT-Trie Implementation Baed on Tessil hat-trie"
HOMEPAGE="https://github.com/silviucpp/etrie"
SRC_URI="
	https://github.com/silviucpp/etrie/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Tessil/hat-trie/archive/${HAT_TRIE_COMMIT}.tar.gz -> hat-trie-${HAT_TRIE_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mkdir -p "${S}"/_build/deps
	ln -sv "${WORKDIR}"/hat-trie-${HAT_TRIE_COMMIT} "${S}"/_build/deps/hat-trie
	sed -e '/git checkout/d' \
		-i build_deps.sh
	rebar_src_prepare
}
