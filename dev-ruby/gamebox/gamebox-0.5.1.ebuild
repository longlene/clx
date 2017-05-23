# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="Framework for building and distributing games using Gosu"
HOMEPAGE="http://shawn42.github.com/gamebox"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/conject-0.0.8"
ruby_add_rdepend ">=dev-ruby/gosu-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/kvo-0.1.0"
ruby_add_rdepend ">=dev-ruby/listen-2.4.0"
ruby_add_rdepend ">=dev-ruby/publisher-0"
ruby_add_rdepend ">=dev-ruby/require_all-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/tween-0"

