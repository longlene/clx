# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="A NIF wrapper around a basic bloom filter"
HOMEPAGE="https://github.com/SemanticSugar/ebloom"
SRC_URI="https://github.com/SemanticSugar/ebloom/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
}
