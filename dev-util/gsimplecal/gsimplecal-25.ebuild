# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="A lightweight calendar designed for tint2"
HOMEPAGE="http://code.google.com/p/gsimplecal/"
SRC_URI="http://gsimplecal.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libunique
	 x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -e "s:CC = g++:CC = $(tc-getCXX) :g" \
	-e "s:CXXFLAGS = -g :CXXFLAGS = ${CXXFLAGS} :g" \
	-e "s:LDFLAGS = :LDFLAGS = ${LDFLAGS} :g" \
	-i "$S"/Makefile
}

src_compile() {
	CXX=$(tc-getCXX) emake PREFIX=/usr
}

src_install() {
	dobin gsimplecal
}
