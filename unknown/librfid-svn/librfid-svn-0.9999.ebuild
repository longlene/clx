# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion perl-module flag-o-matic

ESVN_REPO_URI="https://svn.gnumonks.org/trunk/librfid/"
ESVN_PROJECT="libmrtd"
ESVN_BOOTSTRAP="NOCONFIGURE=1 ./autogen.sh"

DESCRIPTION="LIBRFID is a library to enable use of certain RFID readers"
HOMEPAGE="http://openmrtd.org/projects/librfid/index.html"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		dev-util/subversion
		dev-util/pkgconfig"

src_unpack() {
	subversion_src_unpack
	# We need to create the ChangeLog here
	TZ=UTC svn log -v "${ESVN_REPO_URI}" >ChangeLog
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "could not install"
	dobin rfid-tool mifare-tool send_script
	dodoc README TODO
}

