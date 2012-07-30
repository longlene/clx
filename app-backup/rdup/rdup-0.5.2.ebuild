# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KEYWORDS="~amd64 ~x86"
DESCRIPTION="rdup is a platform for backups. It provides a list of files to backup and the necessary mechanisms to process them. It delegates the encryption, compression, transfer and packaging to other utilities in a true Unix-way."
HOMEPAGE="http://www.miek.nl/projects/rdup/index.html"
SRC_URI="http://www.miek.nl/projects/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
IUSE="crypt"

DEPEND="sys-devel/make
		app-arch/bzip2
		app-arch/gzip
		dev-util/pkgconfig
		net-misc/openssh
		sys-apps/coreutils
		dev-lang/perl
		crypt? ( app-crypt/mcrypt )
		>=dev-libs/glib-2
		dev-perl/File-Copy-Recursive
		sys-apps/attr
		>=app-shells/bash-3"

RDEPEND="${DEPEND}"

src_compile() {
	econf || die "conf failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "install failed"

	dodoc ChangeLog DEPENDENCIES DESIGN README AUTHORS LICENSE
}

pkg_postinst() {
	elog "See the ${PN} man page for usage details and examples."
}
