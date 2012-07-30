# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Open-source application for notetaking, sketching, etc. on a tablet PC"
HOMEPAGE="http://www.dklevine.com/general/software/tc1000/jarnal.htm"
SRC_URI="http://www.dklevine.com/general/software/tc1000/jarnal-install.zip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jdk-1.5.0"

src_unpack() {
	unpack ${A}
}

src_compile()
{
	# No compilation necessary
	true
}

src_install()
{
	dodir /opt/jarnal
	cp -rv . ${D}/opt/jarnal/

	dodir /usr/bin
	echo -e "#! /bin/sh\nexec /opt/jarnal/jarnal.sh $*" > ${D}/usr/bin/jarnal
	echo -e "#! /bin/sh\nexec /opt/jarnal/jarnalannotate.sh $*" > \
		${D}/usr/bin/jarnalannotate

	fperms a+x /usr/bin/jarnalannotate /usr/bin/jarnal || die "Oops"
	fperms a+x jarnal.sh jarnalannotate.sh || die "Oops2"
}
