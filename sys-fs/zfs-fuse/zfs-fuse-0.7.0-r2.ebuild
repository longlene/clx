# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-accessibility/speakup/speakup-9999.ebuild,v 1.3 2009/12/03 20:43:20 williamh Exp $

IUSE="doc debug"

DESCRIPTION="An implementation of the ZFS filesystem for FUSE/Linux"
HOMEPAGE="http://zfs-fuse.net"

EAPI="2"
EGIT_REPO_URI="http://git.zfs-fuse.net/official"
EGIT_BRANCH="maint"

inherit git-2 linux-mod autotools

SRC_URI=""

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=sys-libs/glibc-2.3.3
		>=dev-util/scons-0.96.1
		>=dev-libs/libaio-0.3
		>=sys-fs/fuse-2.6.1"

RDEPEND=">=sys-fs/fuse-2.6.1"

S="${WORKDIR}/${P}/src"

src_prepare() {
	cd "${S}"/src
	git checkout ${EGIT_BRANCH}

	cd "${S}"/src/lib/libumem
	eautoreconf
}

src_compile() {
	cd "${S}"/src
	scons || die "Make failed"
}

src_install() {
	cd "${S}"
	cd src
	if useq debug; then
		mv cmd/ztest/ztest cmd/ztest/run-ztest || die
		mv cmd/ztest/runtest.sh cmd/ztest/ztest || die
		dosbin cmd/ztest/run-ztest || die
	fi
	dosbin cmd/ztest/ztest || die

	if useq debug; then
		mv zfs-fuse/zfs-fuse zfs-fuse/run-zfs-fuse || die
		mv zfs-fuse/run.sh zfs-fuse/zfs-fuse || die
		dobin zfs-fuse/run-zfs-fuse || die
	fi
	dosbin "zfs-fuse/zfs-fuse" || die

	dosbin "cmd/zfs/zfs" || die
	dosbin "cmd/zpool/zpool" || die
	dosbin "cmd/zdb/zdb" || die

	doinitd "${FILESDIR}"/${PN} || die

	keepdir /var/lock/zfs || die
	fowners daemon.disk /var/lock/zfs || die

	keepdir /var/run/zfs || die
	fowners daemon.disk /var/run/zfs || die

	cd "${WORKDIR}/${P}/src" || die

	dodoc CHANGES || die

	if use doc; then
		dodoc {INSTALL,TODO,STATUS,TESTING,HACKING,BUGS} || die
	fi
}

pkg_postinst() {
	echo
	einfo "To debug and play with ZFS-FUSE make sure you have a recent 2.6.xx"
	einfo "series kernel with the FUSE module compiled in OR built as a"
	einfo "kernel module."
	einfo
	einfo "You can start the ZFS-FUSE daemon by running"
	einfo
	einfo "     /etc/init.d/zfs-fuse start"
	einfo
	einfo "as root from the command line. "
	einfo
	einfo "And don't forget to add it permanently, if you want to:"
	einfo
	einfo "    rc-update add zfs-fuse boot"
	einfo
	einfo "For additional ZFS related commands I recommend the ZFS admin"
	einfo "guide. http://opensolaris.org/os/community/zfs/docs/zfsadmin.pdf"
	einfo
	einfo "Don't forget this is an beta-quality release. Testing has been"
	einfo "very limited so please make sure you backup any important data."
	einfo
	einfo "If you have any problems with zfs-fuse please visit the ZFS-FUSE."
	einfo "website at http://zfs-fuse.net/"
	einfo "website at http://developer.berlios.de/projects/zfs-fuse/"
	echo
}
