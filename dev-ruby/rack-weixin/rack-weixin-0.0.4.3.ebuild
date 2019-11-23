# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="Rack middleware for Weixin apps: message validation/parser/generator"
HOMEPAGE="https://github.com/wolfg1969/rack-weixin"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/multi_json-1.7.9"
ruby_add_rdepend ">=dev-ruby/multi_xml-0.5.2"
ruby_add_rdepend ">=dev-ruby/nestful-0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/roxml-0"

