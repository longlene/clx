# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit multilib ruby-ng

DESCRIPTION="A gnome applet interface to SSH"
HOMEPAGE="http://sshmenu.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="gnome"

RUBY_PATCHES=( ${P}-fixmultilib.patch )

RDEPEND="!gnome? ( net-misc/x11-ssh-askpass )"

ruby_add_rdepend gnome "dev-ruby/ruby-gconf2 dev-ruby/ruby-panel-applet2"
ruby_add_rdepend ">=dev-ruby/ruby-gtk2-0.19.3"

all_ruby_install() {
	emake LIBDIR="$(get_libdir)" DESTDIR="${D}" install || die "Install failed!"
}
