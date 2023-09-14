# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

inherit ruby-fakegem

DESCRIPTION="ROXML is a Ruby library designed to make it easier for Ruby developers to work with XML"
HOMEPAGE="http://roxml.rubyforge.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-2.3.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.3.3"

