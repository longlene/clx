# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Scheme interpreter. Also The GNU extension language"
HOMEPAGE="http://www.gnu.org/software/guile/"
SRC_URI="mirror://gnu/guile/${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
#KEYWORDS="~amd64"
# Work in progress. No keywords.
# TODO: 
# 1. Emacs support 
# 2. Testing agains revdeps
# 3. Check file placing
# 4. ...
KEYWORDS=""
IUSE="networking +regex +deprecated nls debug-malloc debug +threads static"

RDEPEND="
	dev-libs/gmp
	virtual/libiconv
	virtual/libintl
	sys-devel/libtool
	dev-libs/boehm-gc
	dev-libs/libunistring
	dev-libs/libffi"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
		--disable-rpath \
		$(use_enable static) \
		--disable-error-on-warning \
		$(use_enable debug-malloc) \
		$(use_enable debug guile-debug) \
		--enable-posix \
		$(use_enable networking) \
		$(use_enable regex) \
		$(use_enable deprecated) \
		$(use_enable nls) \
		$(use_with threads) \
		--with-modules
}

src_install() {
	einstall || die "einstall failed"
	dodoc AUTHORS ChangeLog GUILE-VERSION HACKING NEWS README THANKS || die
}
