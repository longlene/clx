# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit subversion

DESCRIPTION="LeoCAD is a CAD program that uses bricks similar to those found in many toys."
HOMEPAGE="http://www.leocad.org"

ESVN_REPO_URI="http://svn.gerf.org/${PN}/trunk"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

IUSE="jpeg zlib png"

RDEPEND="virtual/opengl
	x11-libs/gtk+:2
	jpeg? ( media-libs/jpeg )
	zlib? ( sys-libs/zlib )
	png? ( media-libs/libpng )"
DEPEND="${RDEPEND}"

src_unpack() {
	subversion_src_unpack
	cd "${S}"

	if ! use jpeg; then
		sed -i \
			-e "s:(test -s jpegtest); then :{(test -s jpegtest);} \&\& false; then :" \
			config.mk || die "patching Makefile failed"
	fi
	if ! use zlib; then
		sed -i \
			-e "s:(test -s ztest); then :{(test -s ztest);} \&\& false; then :" \
			config.mk || die "patching Makefile failed"
	fi
	if ! use png; then
		sed -i \
			-e "s:(test -s pngtest); then :{(test -s pngtest);} \&\& false; then :" \
			config.mk || die "patching Makefile failed"
	fi
}

src_compile() {
	emake config || die
	emake || die
}

src_install() {
	dobin bin/leocad || die
	doman docs/leocad.1 || die
	dodoc docs/*.txt || die
}

pkg_postinst() {
	elog "Due to a missing release number, automatic fetching of the"
	elog "pieces library is disabled. Please download it yourself:"
	elog
	elog "	wget http://www.leocad.org/files/pieces.zip"
	elog
	elog "and unpack it with the following command:"
	elog
	elog "	unzip pieces.zip"
}
