# Copyright 1999-2008 Gentoo Foundation                                              
# Distributed under the terms of the GNU General Public License v2                   
# $Header: $                                                                         

EAPI=5
inherit base git-2 autotools

DESCRIPTION="Glib bindings for Freesmartphone Framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"
EGIT_REPO_URI="git://git.freesmartphone.org/libfso-glib.git"
EGIT_COMMIT="5cda3952855d6c4273929449339b04509387bdd2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""
DOCS="README"

RDEPEND=">=dev-libs/dbus-glib-0.70
	>=dev-libs/glib-2.12.0
	>=dev-util/vala-dbus-binding-tool-0.1.3
	=sys-mobilephone/fso-specs-2010.05.11.2"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.9"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake -j1
}
