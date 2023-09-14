# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="DECnet phase IV end-node and routing capabilities on your Linux box"
HOMEPAGE="http://linux-decnet.sourceforge.net/"
SRC_URI="http://easynews.dl.sourceforge.net/sourceforge/linux-decnet/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="uselocaldir"

DEPEND=">=sys-apps/sed-4.1.5
	>=app-arch/tar-1.16.1
	>=sys-devel/binutils-2.17
	>=sys-devel/make-3.81
	>=sys-apps/coreutils-6.9-r1"
RDEPEND="${DEPEND}"


src_unpack(){
	unpack ${A}
	if use uselocaldir; then
		epatch "${FILESDIR}"/${P}-usrlocal.patch || die "patch failed"
	fi
	epatch "${FILESDIR}"/${P}-nokerneldnh.patch || die "patch failed"
	cp "${FILESDIR}"/dnetconf "${S}"/scripts/
	cp "${FILESDIR}"/dnetd "${S}"/scripts/
	epatch "${FILESDIR}"/${P}-linuxconf.patch || die "patch failed"
}


src_compile() {
#	make depend doesn't work right now:FIXME
#	emake -j1 dep || die "emake depend failed"
	emake -j1 ||  die "emake failed"

}

src_install(){
	if use uselocaldir; then
		elog "Installing in local dir"
	else
		elog "Not installing in local dir. If you would like to install in local dir then add USE=uselocaldir before the emerge command"
	fi
	emake DESTDIR="${D}" install || die "emake install failed"
	fperms  644 /etc/conf.d/dnetd
	fperms  755 /etc/init.d/dnetd
}

pkg_postinst(){
	elog "NOTE: Whenever the startup script /etc/init.d/dnetd is called it must"
	elog "be run before the TCP/IP initialization because it needs to set the MAC address "
	elog "of the ethernet card. Right now /etc/init.d/dnetd might not run at the right time"
	elog "during your startup.  Instead of adding dnetd to the default runlevel,"
	elog "you might want to add to your /etc/conf.d/local.start. To read an example please"
	elog "read the information in /etc/conf.d/dnetd."

	elog "You will also now have an example configuration file (called /etc/decnet.conf.sample)."
	elog "You should copy this to /etc/decnet.conf and edit it"
	elog "to contain the details for your Linux machine (the executor) and all DECnet"
	elog "nodes with which you want to communicate - see the man page for more details."

	elog "You may also want to configure a DECnet proxies file. See the FAL"
	elog "documentation and the decnet.proxy(5) man page for more information."

}
