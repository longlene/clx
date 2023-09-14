# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib

DESCRIPTION="A Lua interface to the Linux inotify subsystem"
HOMEPAGE="http://www3.telus.net/taj_khattra/luainotify.html"
SRC_URI="http://www3.telus.net/taj_khattra/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test valgrind"

RDEPEND="
	<dev-lang/lua-5.2.0
	valgrind? (
		dev-util/valgrind
		sys-libs/glibc[debug] )"
DEPEND="${RDEPEND}
	test? (
		dev-util/valgrind
		sys-libs/glibc[debug] )"

src_prepare() {
	sed -i \
		-e "s|/usr/local/src/lua/lua-5.1.4|/usr/include|" \
		-e "s|-O2 -g -Wall|${CFLAGS}|" \
		-e "s|/src||" \
		-e "s|-s |${LDFLAGS}|" \
		Makefile || die
}

src_compile() {
	if use test;
	then
		emake test
	fi
	if use valgrind;
	then
		emake valgrind
	else
		emake
	fi
}

src_install() {
	insinto /usr/$(get_libdir)/lua/5.1
	doins inotify.so
	fperms 755 /usr/$(get_libdir)/lua/5.1/inotify.so
	dodoc DOC README
}
