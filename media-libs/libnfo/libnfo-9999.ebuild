# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit eutils mercurial

DESCRIPTION="Small library used to parse and write NFO files."

HOMEPAGE="http://${PN}.geexbox.org/"

#SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"
: ${EHG_REPO_URI:=http://hg.geexbox.org/${PN}}

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS=""

IUSE="debug doc"

RDEPEND="dev-libs/libxml2"

# add build-only dependencies
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${PN}"

src_unpack() {
	mercurial_src_unpack
	cd "${S}"
}

src_configure() {
	local conflibdir
	if [ "${ARCH}" = "amd64" ]; then
		conflibdir="--libdir=/usr/lib64"
	fi
	./configure \
		--prefix=/usr \
		${conflibdir} \
		--disable-strip \
		$(use_enable debug ) \
		$(use_enable doc ) \
		|| die "./configure failed"
}

src_install() {
	einstall DESTDIR="${D}" || die "einstall failed"
	dodoc AUTHORS ChangeLog README
}
