# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit ruby gems

DESCRIPTION="Console email client for large email boxes, in ruby."
HOMEPAGE="http://sup.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-lang/ruby-1.8.6
	>=dev-ruby/ruby-ferret-0.10.13
	>=dev-ruby/ncurses-ruby-0.9.1
	>=dev-ruby/ruby-rmail-0.17
	dev-ruby/highline
	dev-ruby/net-ssh
	>=dev-ruby/trollop-1.7
	dev-ruby/ruby-lockfile
	dev-ruby/mime-types
	dev-ruby/ruby-gettext
	dev-ruby/fastthread 
	dev-ruby/hoe
	"
RDEPEND=${DEPEND}
