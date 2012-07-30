# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="A stock market observation tool"
HOMEPAGE="http://www.grism.org"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://rubyforge.org/frs/download.php/28939/${P}.tar.gz"

RDEPEND=">=x11-libs/gtk+-2.8.0
	dev-lang/ruby
	>=dev-ruby/ruby-gtk2-0.14
	gnome-base/libglade
	dev-ruby/ruby-libglade2
	>=x11-libs/cairo-1.0
	>=dev-ruby/rcairo-1.0"

DEPEND="${RDEPEND}"

src_configure() {
	ruby setup.rb config || die "Problem in config phase."
}

src_compile() {
	ruby setup.rb setup || die "Problem in setup phase."
}

src_install() {
	ruby setup.rb install --prefix="${D}" || die "Problem in install
	phase."
}
