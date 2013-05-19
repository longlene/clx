# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"
MY_P="gd2-${PV}"

DESCRIPTION="Ruby bindings for the GD 2.x graphics library."
HOMEPAGE="http://gd2.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${MY_P}.gem"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8.4"
RDEPEND="${DEPEND}
	>=media-libs/gd-2.0.0"
