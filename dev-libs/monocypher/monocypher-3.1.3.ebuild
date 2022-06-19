# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An easy to use, easy to deploy, auditable crypto library written in portable C"
HOMEPAGE="https://monocypher.org/"
SRC_URI="https://monocypher.org/download/${P}.tar.gz"

LICENSE="CC0-1.0 BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_prepare() {
	default
	sed -e '/PREFIX=/{s#/local##}' \
		-e "/LIBDIR=/{s#/lib#/$(get_libdir)#}" \
		-i makefile
}

src_compile() {
	emake USE_ED25519=1
}

src_install() {
	emake USE_ED25519=1 DESTDIR="${D}" install
}
