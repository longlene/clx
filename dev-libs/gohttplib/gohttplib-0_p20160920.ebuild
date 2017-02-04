# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="a3a1f70ec62a1e17ddd00f707f2c0ac1bc0ae01a"

DESCRIPTION="Expose net/http.Server as a library with C bindings"
HOMEPAGE="https://github.com/shazow/gohttplib"
SRC_URI="https://github.com/shazow/gohttplib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's#build/:#build:#' Makefile
}

src_compile() {
	if use static ; then
		emake build/libgohttp.a
	else
		emake build/libgohttp.so
	fi
}

src_install() {
	if use static ; then
		dolib.a build/libgohttp.a
	else
		dolib.so build/libgohttp.so
	fi
	insinto /usr/include
	doins build/libgohttp.h
	dodoc README.md
}
