# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib

DESCRIPTION="CarpVM"
HOMEPAGE="https://github.com/tekknolagi/carp"
SRC_URI="https://github.com/tekknolagi/carp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/PREFIX/ s/local//' \
		-e "/{PREFIX}\/lib/ s:{PREFIX}/lib:{PREFIX}/$(get_libdir):g" \
		-i Makefile
}

src_compile() {
	make build || die "compile failed"
}

src_install() {
	dobin carp
	insinto /usr/include/carp
	doins src/*.h
	insinto /usr/include/carp/lib
	doins src/lib/*.h
	dolib.a  libcarp.a
	dodoc README.md
}
