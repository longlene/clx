# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit base git-2 autotools

DESCRIPTION=""
HOMEPAGE="http://www.freesmartphone.org"
EGIT_REPO_URI="git://git.freesmartphone.org/cornucopia.git"
EGIT_PROJECT="cornucopia"
EGIT_COMMIT="1f9281ac4320eed66411fde8fe21ea87ee138e78"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"

RDEPEND=">=dev-libs/glib-2.18.0
	>=dev-libs/libgee-0.5.0
	sys-mobilephone/libfsobasics
	sys-mobilephone/libfsoframework
	sys-mobilephone/libfso-glib"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.8.0"

src_prepare() {
	S="${WORKDIR}/${P}/tools/${PN}"
	cd ${S}
	eautoreconf
}
