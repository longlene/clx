# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A deployment and management system for Lua modules"
HOMEPAGE="http://luarocks.org"
SRC_URI="http://luarocks.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE="curl openssl"

DEPEND="dev-lang/lua
		curl? ( net-misc/curl )
		openssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}
		app-arch/unzip"

src_compile() {
	USE_MD5="md5sum"
	USE_FETCH="wget"
	use openssl && USE_MD5="openssl"
	use curl && USE_FETCH="curl"

	# Econf doesn't work b/c it passes variables the custom configure
	# can't handle.
	./configure \
			--prefix=/usr \
			--rocks-tree=/usr/lib/lua/luarocks \
			--with-lua=/usr \
			--with-lua-lib=/usr/$(get_libdir) \
			--with-downloader=$USE_FETCH \
			--with-md5-checker=$USE_MD5 \
			--force-config || die "configure failed"
	emake DESTDIR="${D}" || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}

pkg_preinst() {
	find "${D}" -type f | xargs sed -i -e "s:${D}::g" || die "sed failed"
}
