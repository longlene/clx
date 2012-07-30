# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils fdo-mime

MY_P="${P/_p/-}"
DESCRIPTION="A GNU/Linux gtk2.0 front-end for various command line archiving tools."
HOMEPAGE="http://xarchive.sourceforge.net/"
#SRC_URI="mirror://sourceforge/${PN}/${P}-${PR:1}.tar.gz"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ace arj deb rar zip 7z rpm"

DEPEND=">=x11-libs/gtk+-2.0
	ace? ( app-arch/unace )
	arj? ( app-arch/arj )
	deb? ( app-arch/dpkg )
	rar? ( app-arch/rar )
	zip? ( app-arch/zip \
		   app-arch/unzip )
	7z?  ( app-arch/p7zip )
	rpm? ( app-arch/rpm )"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	cd ${S}

	# Do not build wrappers for archivers we don't want support for
	for archiver in ${IUSE//[+-]}
	do
		use $archiver || {	sed -i -e "/OSSCRIPT/s#${archiver/7z/7za}[^\.]*\.sh##g; \
									   /BSDSRCS/s#${archiver/7z/7za}[^\.]*\.src##g; \
									   /GNUSRCS/s#${archiver/7z/7za}[^\.]*\.src##g; \
									   /GENERICSCRIPTS/s#${archiver/7z/7za}[^\.]*\.sh##g; \
								       /GENERICSRCS/s#${archiver/7z/7za}[^\.]*.src##g" wrappers/Makefile.in ;
							sed -i -e "/MimeType/s#[^;=]*[-/]$archiver[^;]*;##g" xarchive.desktop.src ; }
		# Add missing mimetypes for archivers we do want support for
		if use $archiver
		then
			case $archiver in
				ace)
					mimetype+="application/x-ace;"
					;;
				arj)
					mimetype+="application/x-arj;"
					;;
				deb)
					mimetype+="application/x-deb;"
					;;
				rar)
					mimetype+="application/x-rar-compressed;"
					;;
				7z)
					mimetype+="application/x-7z-compressed;"
					;;
				rpm)
					mimetype+="application/x-rpm;"
					;;
			esac
		fi
	done


	[[ -n "$mimetype" ]] && sed -i -e "/MimeType/s#\$#$mimetype#" xarchive.desktop.src
}

src_install() {
	# TODO: what?!
	cat {D}
	make DESTDIR=${D} install || die "install failed"

	insinto /usr/share/applications
	doins	${S}/xarchive.desktop

	dodoc AUTHORS ChangeLog NEWS README
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
