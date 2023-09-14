# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lightweight package management system"
HOMEPAGE="https://www.yoctoproject.org/software-item/opkg/"
SRC_URI="http://downloads.yoctoproject.org/releases/opkg/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gpg"

DEPEND="
	app-arch/libarchive
	app-arch/xz-utils	
	net-misc/curl[ssl]
	gpg? ( app-crypt/gpgme )
"
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable gpg)
}
