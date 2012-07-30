# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mercurial

DESCRIPTION="${PN} - interface library to allow C programs to interact with a running VDR, via SVDRP protocol."

HOMEPAGE="http://${PN}.geexbox.org/"

#SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"
: ${EHG_REPO_URI:=http://hg.geexbox.org/${PN}}

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS=""

IUSE="doc"

RDEPEND="sys-libs/glibc"

# add build-time dependencies
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${PN}"

src_unpack() {
	mercurial_src_unpack
	cd "${S}"
}

src_configure() {
	local conf
	if [ "${ARCH}" = "amd64" ]; then
		conf="--libdir=/usr/lib64"
	fi
	if use doc; then
		conf="${conf} \
			--docdir=/usr/share/doc/${P}"
	else
		conf="${conf} \
			--disable-doxygen-doc"
	fi
	./autogen.sh \
		--prefix=/usr \
		--exec-prefix=/usr \
		--includedir=/usr/include \
		${conf} \
		|| die "./configure failed"
}

src_install() {
	einstall DESTDIR="${D}" || die "einstall failed"
	dodoc AUTHORS README
}
