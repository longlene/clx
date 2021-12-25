# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple library providing utilities for properly handling Unicode strings"
HOMEPAGE="https://libs.suckless.org/libgrapheme/"
SRC_URI="https://dl.suckless.org/libgrapheme/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/PREFIX =/{s#/usr/local#/usr#}' config.mk
}

src_install() {
	insinto /usr/include
	doins grapheme.h
	dolib.a libgrapheme.a
	doman man/*
	dodoc README
}
