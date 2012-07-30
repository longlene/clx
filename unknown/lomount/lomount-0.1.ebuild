# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="QEMU HD-Mounter (lomount)"
HOMEPAGE="http://www.dad-answers.com/download/qemu/utilities/QEMU-HD-Mounter/"
SRC_URI="http://www.dad-answers.com/download/qemu/utilities/QEMU-HD-Mounter/qemu-hd-mounter.tar.gz"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND=""
S=${WORKDIR}/${P}

MY_P="lomount"
MY_S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A} || die "Unpacking the source failed"
	cd ${MY_P} || die "Could not change directory."
}

src_compile() {
	cd ${MY_S} || die "Could not change directory."
	emake || die "Make failed"
}

src_install() {
	dobin ${MY_S}/lomount || die "Install failed"
}
