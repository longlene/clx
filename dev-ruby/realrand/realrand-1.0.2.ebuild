# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="Generate real random numbers in Ruby."
HOMEPAGE="http://realrand.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="test"

DEPEND=">=dev-lang/ruby-1.8.4"
RDEPEND=${DEPEND}

pkg_postinst() {
	einfo "All the HTTP services supported and used by this library are"
	einfo "offered for free by their respective owners. Please have a look at"
	einfo "their websites to make sure you follow their terms of use."
	einfo
	einfo "http://www.random.org/"
	einfo "http://www.fourmilab.ch/hotbits/"
	einfo "http://random.hd.org/"
}
