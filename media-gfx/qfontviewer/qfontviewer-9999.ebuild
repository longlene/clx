# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A font viewer with character table"
HOMEPAGE="http://qfontviewer.sourceforge.net"

if [[ ${PV} == "9999" ]] ; then
	inherit git
	EGIT_REPO_URI="git://github.com/sbar/qfontviewer"
else
	SRC_URI="http://sourceforge.net/projects/qfontviewer/files/${P}.tar.bz2"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/qt-gui-4.5.0"
RDEPEND=""

src_compile() {
	if [[ ${PV} == "9999" ]] ; then
		mv "${S}" "${WORKDIR}/${PN}"

		# to get the revision number configure script needs in .svn directory
		# FIXME: get distfiles directory from environment variable
		cp -r "/usr/portage/distfiles/svn-src/${PN}/${PN}/.svn" "${WORKDIR}/${PN}/"
	fi
	cd "${WORKDIR}/${PN}"

	econf || die "configure failure"
	emake || die "make failure"
}

src_install() {
	cd "${WORKDIR}/${PN}"
	dodoc ChangeLog README HACKING TODO
	insinto /usr/bin
	doins qfontviewer
	fperms 755 /usr/bin/qfontviewer
}
