# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit multilib

DESCRIPTION="Higher level programming in C"
HOMEPAGE="http://libcello.org/"
SRC_URI="http://libcello.org/static/libCello-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/clang"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s|\/lib|\/$(get_libdir)|" Makefile
	sed -i 's/-Werror //' Makefile
}

src_compile() {
	CC=clang emake
}

src_install() {
	emake PREFIX="${D}"/usr install
}
