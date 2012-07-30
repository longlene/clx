# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Serverless print spooler implemented as bash skript"
HOMEPAGE="http://lpr-bash.sourceforge.net"
SRC_URI="mirror://sourceforge/lpr-bash/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~mips ~ppc ~ppc64 ~sparc x86"
IUSE_LINGUAS="en us de"
IUSE="samba"

DEPEND=""
RDEPEND=">=app-shells/bash-2.05b
		 virtual/ghostscript
		 a2ps? ( app-text/a2ps )
		 imagemagick? ( media-gfx/imagemagick )
		 enscript? ( app-text/enscript )
		 samba? ( net-fs/samba )
		 !virtual/lpr"
PROVIDE="virtual/lpr"

src_unpack() {
		unpack ${A}
}

src_install() {
		# executables (lpr, inputtops, lprq, lpstat, lprm, printcap-convert, 
		# pstoprinter)
		exeinto /usr/bin
		doexe ${WORKDIR}/lpr
		doexe ${WORKDIR}/printcap-convert
		dosym /usr/bin/lpr /usr/bin/inputtops
		dosym /usr/bin/lpr /usr/bin/lpq
		dosym /usr/bin/lpr /usr/bin/lpstat
		dosym /usr/bin/lpr /usr/bin/lprm
		dosym /usr/bin/lpr /usr/bin/pstoprinter

		# setup spool directory
		dodir /var/spool/lpr-bash
		enewgroup print
		fowners root:print /var/spool/lpr-bash
		fperms 770 /var/spool/lpr-bash

		# i18n files
		dodir /usr/share/lpr
		insinto /usr/share/lpr
		doins ${WORKDIR}/i18n/lpr.*

		# docs, manpages
		dodoc ${WORKDIR}/{CHANGES,CREDITS,README,README.de,TODO}
		LINGUAS="de" && doman ${WORKDIR}/manpages/de/*.[15]
		LINGUAS="de" || doman ${WORKDIR}/manpages/en/*.[15]
}

pkg_config() {
		# configuration
		insinto /etc
		doins ${WORKDIR}/printcap.example
		doins ${WORKDIR}/lpr.conf.example

		# give some infos
		einfo "Please change the /etc/printcap to match your needs."
		einfo "All users who are allowed to print should be put into"
		einfo "the print group."
}
