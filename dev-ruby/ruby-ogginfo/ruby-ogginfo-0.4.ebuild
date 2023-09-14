# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="History.txt README.txt"

inherit ruby-fakegem

DESCRIPTION="A pure Ruby library for reading metadata from ogg files"
HOMEPAGE="http://rubyforge.org/projects/ruby-ogginfo/"
SRC_URI="mirror://rubyforge/${PN}/${P}.tgz"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

ruby_add_bdepend doc dev-ruby/hoe
ruby_add_bdepend test virtual/ruby-test-unit
