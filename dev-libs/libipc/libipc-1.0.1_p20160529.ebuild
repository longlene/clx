# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

MY_VERSION=${PV%_*}
MAJOR_VERSION=${MY_VERSION%.*.*}

EGIT_COMMIT="ff5b1aa25fa5e7e65a1a8e4ca29944609b6cd17c"

DESCRIPTION="A lightweight IPC mechanism"
HOMEPAGE="https://github.com/mheily/libipc"
SRC_URI="https://github.com/mheily/libipc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libkqueue
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/check_header/{s#sys/event.h#kqueue/sys/event.h#}' configure
	sed -e '/check_header/{s#sys/event.h#kqueue/sys/event.h#}' \
		-e '/-std=/{s#c99#gnu11#}' \
		-i src/configure
}

src_configure() {
	./configure || die "configure failed"
}

src_compile() {
	emake CFLAGS=$(pkg-config --cflags libkqueue) LDADD=$(pkg-config --libs libkqueue)
}

src_install() {
	insinto /usr/include
	doins include/ipc.h
	dolib.so src/libipc.so.${MY_VERSION}
	dosym libipc.so.${MY_VERSION} /usr/$(get_libdir)/libipc.so.${MAJOR_VERSION}
	dosym libipc.so.${MAJOR_VERSION} /usr/$(get_libdir)/libipc.so
	dodoc README.md
}
