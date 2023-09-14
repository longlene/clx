# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# net-ftp/bftpd/bftpd-1.5.ebuild

KEYWORDS="~x86 ~amd64"

DESCRIPTION="easy configurable FTP server"
HOMEPAGE="http://www.bftpd.sourceforge.net/"
SRC_URI="http://bftpd.sourceforge.net/downloads/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"

IUSE="debug gzip logrotate pam xinetd"

DEPEND="pam? ( || ( virtual/pam sys-libs/pam ) )
	gzip? ( || ( sys-libs/zlib ))
"

RDEPEND="${DEPEND}
	net-ftp/ftpbase
	logrotate? ( app-admin/logrotate )
	xinetd? ( sys-apps/xinetd )
"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	local myconf=""
	if use gzip
	then
		myconf=" --enable-zlib"
	fi
	myconf="${myconf} $(use_enable pam)"
	myconf="${myconf} $(use_enable debug)"

	econf ${myconf} || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	dosbin bftpd

	if use logrotate
	then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/bftpd.logrotate" bftpd
	fi

	if use xinetd
	then
		insinto /etc/xinetd.d
		newins "${FILESDIR}/bftpd.xinetd" bftpd
	fi

	doman bftpd.8
	newdoc bftpd.conf bftpd.conf.example
	dodoc COPYING CHANGELOG README TODO
	dohtml doc/en/*.html
}

pkg_postinst() {
	echo
	einfo "bftpd runs either with inetd or standalone"
	einfo "An example for /etc/bftpd.conf is in /usr/share/doc/bftpd-1.5"
	echo

	if use gzip
	then
		einfo "gzip on the fly is supported with this installation of bftpd"
		einfo "you can now set GZ_UPLOAD="yes" and GZ_DOWNLOAD="yes" in /etc/bftpd.conf"
		echo
	fi
}
