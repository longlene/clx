# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools

DESCRIPTION="Library for  emulates a PPP or SLIP connection over a normal terminal."
HOMEPAGE="http://cgit.freedesktop.org/spice/slir"
EGIT_REPO_URI="git://cgit.freedesktop.org/spice/slirp"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	git_src_prepare
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}"  install || die
}
