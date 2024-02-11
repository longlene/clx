# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An Erlang project builder"
HOMEPAGE="https://github.com/galdor/eon"
SRC_URI="https://github.com/galdor/eon/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-lang/erlang
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin eon
}
