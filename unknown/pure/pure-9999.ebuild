# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools subversion eutils

ESVN_REPO_URI="http://pure-lang.googlecode.com/svn/trunk/pure"
ESVN_CO_DIR="${PORTAGE_ACTUAL_DISTDIR-${DISTDIR}}"/svn-src/${PN}/"${ESVN_REPO_URI##*/}"
ESVN_PROJECT="${PN}"

DESCRIPTION="Pure Universal Rewriting Engine, a pure algebraic and functional language"
HOMEPAGE="http://code.google.com/p/pure-lang/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="debug nofastcc libedit"

RDEPEND=">=sys-devel/llvm-2.3
		dev-libs/gmp
		libedit? ( dev-libs/libedit )"

DEPEND="${RDEPEND}"

src_unpack() {

	subversion_src_unpack

	cd ${S}
	einfo "Regenerating autotools files..."
	eautoreconf

}

src_configure() {

	local myconf=""
	
	if use nofastcc; then
		myconf="${myconf} --disable-fastcc"
	fi

	if use debug; then
		myconf="${myconf} --enable-debug"
	else
		myconf="${myconf} --enable-release"
	fi

	if use libedit; then
		myconf="${myconf} --without-readline --with-editline"
	fi
	
	econf ${myconf} || die "Died in action: econf ..."
}

src_compile() {

	emake || die "Died in action: make ..."
	

}

src_install() {

	emake DESTDIR="${D}" install || die "Died in action: make install ... "

}

pkg_postinst() {

	ewarn "This is an unofficial ebuild for Pure language interpreter"

}
