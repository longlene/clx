# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="13f30ad33a227a3e9682578c450777380ecddfcf"

DESCRIPTION="A feature complete LRU cache implementation in C++"
HOMEPAGE="https://github.com/goldsborough/lru-cache"
SRC_URI="https://github.com/goldsborough/lru-cache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_install() {
	doheader -r include/lru
	einstalldocs
}
