# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A set of convenience functions to list class, variable, function, and other symbols"
HOMEPAGE="https://github.com/atlas-engineer/nsymbols"
SRC_URI="https://github.com/atlas-engineer/nsymbols/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "nsymbols\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
