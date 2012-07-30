# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/xz-utils/xz-utils-9999.ebuild,v 1.6 2010/06/19 00:36:37 abcd Exp $

EAPI="2"

EGIT_REPO_URI="git://git.citadel.org/appl/gitroot/citadel.git"
EGIT_PROJECT="citadel"

inherit autotools base git

DESCRIPTION="Git master version of the whole citadel suit"
HOMEPAGE="http://citadel.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/expat
	>=dev-libs/libical-0.43
	net-misc/curl
	mail-filter/libsieve
	>=sys-libs/db-4.1.25_p1"
DEPEND="${RDEPEND}
	>=sys-devel/autoconf-2.52
	>=sys-devel/libtool-1.4"

src_prepare() {
	# this is an ugly workaround to point S to the proper dir.
	# doing so before src_unpack leads to circular path definition and is not helping
	S="${WORKDIR}/${P}/${PN}"
	cd "$S" || die "changing into proper source dir failed"
	rm conftools/libtool.m4 || die "removal of libtool file failed"
	eautoreconf || die "eautoreconf failed"
}
