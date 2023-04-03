# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

USE_RUBY="ruby31 ruby32"
inherit ruby-fakegem

DESCRIPTION="A pure Ruby library for manipulating APEv2 tags"
HOMEPAGE="http://rubyforge.org/projects/apetag/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

IUSE=""

ruby_add_rdepend "dev-ruby/cicphash"
