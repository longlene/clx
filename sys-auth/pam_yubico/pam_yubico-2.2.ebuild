# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="This module allows you to use the Yubikey device to authenticate to
the PAM system."
HOMEPAGE="http://code.google.com/p/yubico-pam/"
SRC_URI="http://yubico-pam.googlecode.com/files/${P}.tar.gz"

LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-auth/pambase
	sys-libs/pam
	sys-libs/ykclient"

RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"
	dodoc ChangeLog NEWS README
}

