# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="OpenGL accelerated 2D game framework for Ruby"
HOMEPAGE="http://ippa.se/chingu"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/crack-0"
ruby_add_rdepend ">=dev-ruby/gosu-0.7.25"
ruby_add_rdepend ">=dev-ruby/rest-client-0"

