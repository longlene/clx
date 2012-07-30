# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Pluggable Authentication Module for face authentication"
HOMEPAGE="http://code.google.com/p/pam-face-authentication/"

if [[ ${PV} == "9999" ]]; then
#	ESVN_REPO_URI="http://pam-face-authentication.googlecode.com/svn/trunk/pam_face_authentication"
	ESVN_REPO_URI="http://pam-face-authentication.googlecode.com/svn/branches/qtbranch"
	inherit subversion
else
	SRC_URI="http://pam-face-authentication.googlecode.com/files/${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=sys-libs/pam-0.99.8
x11-libs/libX11
>=media-libs/opencv-1.0.0"
RDEPEND="${DEPEND}"

src_unpack()
{
	if [[ ${PV} == "9999" ]]; then
		subversion_src_unpack
	else
		unpack ${A}
	fi
}

src_compile()
{
	if [[ ${PV} == "9999" ]]; then
		cd qtbranch
	else
		cd ${P}
	fi
	mkdir build
	cd build
	cmake -D CMAKE_INSTALL_PREFIX=/usr ..
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"  || die "emake failed"
}

src_install() {
	if [[ ${PV} == "9999" ]]; then
		cd qtbranch
	else
		cd ${P}
	fi
	cd build
	emake DESTDIR="${D}" install || die "install failed"
	cd ..
	dodoc README AUTHORS || die "install docs failed"
}
