# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Collections manager"
HOMEPAGE="http://www.gcstar.org"
SRC_URI="http://download.gna.org/gcstar/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""
RESTRICT="nomirror"

DEPEND="dev-lang/perl
	perl-core/Digest-MD5
	perl-core/File-Spec
	perl-core/IO
	perl-core/libnet
	perl-core/MIME-Base64
	perl-core/Storable
	dev-perl/Archive-Tar
	dev-perl/Archive-Zip
	dev-perl/Compress-Zlib
	dev-perl/libwww-perl
	dev-perl/MP3-Info
	dev-perl/MP3-Tag
	dev-perl/Ogg-Vorbis-Header-PurePerl
	dev-perl/XML-Parser
	dev-perl/XML-Simple
	dev-perl/gtk2-perl
	dev-perl/URI"

src_install() {
	$MY_P/install --prefix=${D}/usr || die "install failed"
	dodir /usr
	fperms 755 /usr/bin/gcstar
}
	
MY_P=${WORKDIR}/gcstar
pkg_postinstall() {
	doman /usr/bin/man/gcstar.1
	dodir /usr/share/pixmaps /usr/share/applications/
	insinto /usr/share/pixmaps
	newins /usr/bin/gcstar/share/gcstar/icons/gcstar_64x64.png gcstar.png
	insinto /usr/share/applications
	doinst ${S}/gcstar/share/applications/gcstar.desktop
}


	
