# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils multilib python

DESCRIPTION="An HMO and GoBack server for Tivo."
HOMEPAGE="http://pytivo.sourceforge.net/"
SRC_URI="http://repo.or.cz/w/pyTivo/wmcbrine.git?a=snapshot;h=ebd6eeb6229401398f2d040ce404b86ce409fed0;sf=tgz
	-> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
	media-video/ffmpeg"

S="${WORKDIR}/wmcbrine"

pkg_setup() {
	enewgroup pytivo
	enewuser pytivo -1 -1 -1 pytivo
}

src_install() {
	MY_LIBDIR="/usr/$(get_libdir)/${PN}"

	insinto $MY_LIBDIR
	doins *.py *.pyw  || die "Install failed"
	doins -r Cheetah mutagen plugins templates xmpp || die "Install failed"

	fperms 0755 ${MY_LIBDIR}/pyTivo.py || die "Cannot set permissions"

	newinitd "${FILESDIR}"/pyTivo.initd.sh pytivo \
		|| die "Cannot create init.d launcher"

	dodoc README || die "Cannot install docs"
	newdoc pyTivo.conf.dist pyTivo.conf || die "Cannot install docs"

	dosym ${MY_LIBDIR}/pyTivo.py /usr/bin/pytivo \
		|| die "Cannot create symlink to launcher"
}

pkg_postinst() {
	ewarn "You must setup /etc/pyTivo.conf before pyTivo can be started. A"
	ewarn "sample configuration file pyTivo.conf is available in"
	ewarn "/usr/share/doc/${PF}"
	ewarn

	elog "pyTivo can be run as a normal user or it can be started"
	elog "automatically by adding pytivo to the default runlevel by"
	elog "	# rc-update add pytivo default"
	elog "as root."
}
