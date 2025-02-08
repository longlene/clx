# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="The anaphoric macro collection from Hell"
HOMEPAGE="https://github.com/spwhitton/anaphora"
SRC_URI="https://github.com/spwhitton/anaphora/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :anaphora\/test/,$d' \
		-i ${PN}.asd
}
