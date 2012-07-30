# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

RESTRICT="nomirror"

DESCRIPTION="Tape Copy/Clone for Linux. Implementation of the AIX tcopy utility. Used to clone a tape, or display the record/file structure."
HOMEPAGE="http://sourceforge.net/projects/tcopy/"
SRC_URI="mirror://sourceforge/tcopy/tcopy.tar.gz"

LICENSE="http://www.gentoo.org/cgi-bin/viewcvs.cgi/*checkout*/licenses/GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND=""
S=${WORKDIR}/code

src_compile() 
{
	rm tcopy
	emake || die "Make failed"
}

src_install() 
{
	into /usr
	dobin tcopy
	dodoc README COPYING
}
