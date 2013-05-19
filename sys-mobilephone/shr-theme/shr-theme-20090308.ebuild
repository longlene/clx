# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git autotools

DESCRIPTION="shr-settings; a gui for changing phone settings from the shr-project"
HOMEPAGE="http://trac.shr-project.org/trac"

EGIT_REPO_URI="http://shr.bearstech.com/repo/shr.git"
EGIT_PROJECT="shr-theme"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack() {
	git_src_unpack
	cd "${S}/shr-theme"
	eautoreconf
}

src_compile() {
	cd "${S}/shr-theme"
	econf || die
	emake || die
}

src_install() {
	cd "${S}/shr-theme"
	emake install DESTDIR="${D}" || die
}
