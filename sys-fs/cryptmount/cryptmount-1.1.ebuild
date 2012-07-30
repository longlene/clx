# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic linux-info

DESCRIPTION="A utility for management and user-mode mounting of encrypted filesystems"
HOMEPAGE="http://cryptmount.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls ssl"

DEPEND="sys-fs/device-mapper
	>=dev-libs/libgcrypt-1.1.94
	ssl? ( dev-libs/openssl )
	nls? ( sys-devel/gettext )"
RDEPEND="${DEPEND}"

dm-crypt_check() {
	ebegin "Checking for Device mapper support (BLK_DEV_DM)"
	linux_chkconfig_present BLK_DEV_DM
	eend $?

	if [[ $? -ne 0 ]] ; then
		ewarn "Cryptmount requires Device mapper support!"
		ewarn "Please enable Device mapper support in your kernel config, found at:"
		ewarn "(for 2.6 kernels)"
		ewarn
		ewarn "  Device Drivers"
		ewarn "    Multi-Device Support"
		ewarn "      <*> Device mapper support"
		ewarn
		ewarn "and recompile your kernel if you want this package to work."
		epause 10
	fi
}

pkg_setup() {
	linux-info_pkg_setup
	dm-crypt_check
}

src_compile() {
	# recommended for setXid, dynamically linked biraries
	append-ldflags -Wl,-z,now

	econf \
		--with-gnu-ld \
		--with-libgcrypt \
		$(use_enable nls) \
		$(use_with ssl openssl) \
	|| die "Configuration failed"

	emake || die "Compilation failed"
}

src_install() {
	make install DESTDIR="${D}" || die "Installation failed"
	dodoc ABOUT-NLS AUTHORS ChangeLog NEWS README RELNOTES ToDo
}
