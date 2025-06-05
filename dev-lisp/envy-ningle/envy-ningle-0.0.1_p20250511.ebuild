# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2b1800a83c1f8b474010432fc50916bae004adfb"

DESCRIPTION="Envy utility for ningle "
HOMEPAGE="https://github.com/nmunro/envy-ningle"
SRC_URI="https://github.com/nmunro/envy-ningle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/envy
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/envy-ningle\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
