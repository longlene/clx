# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://faye.jcoglan.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cookiejar-0.3.0"
ruby_add_rdepend ">=dev-ruby/em-http-request-0.3.0"
ruby_add_rdepend ">=dev-ruby/eventmachine-0.12.0"
ruby_add_rdepend ">=dev-ruby/faye-websocket-0.9.1"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-1.0.0"
ruby_add_rdepend ">=dev-ruby/websocket-driver-0.5.1"
ruby_add_rdepend ">=dev-ruby/compass-0.11.0"
ruby_add_rdepend ">=dev-ruby/haml-3.1.0"
ruby_add_rdepend ">=dev-ruby/permessage_deflate-0.1.0"
ruby_add_rdepend ">=www-servers/puma-2.0.0"
ruby_add_rdepend ">=dev-ruby/rack-proxy-0.4.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.99.0"
ruby_add_rdepend ">=dev-ruby/rspec-eventmachine-0.2.0"
ruby_add_rdepend ">=dev-ruby/RedCloth-3.0.0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/sass-3.2.0"
ruby_add_rdepend ">=dev-ruby/staticmatic-0"
ruby_add_rdepend ">=dev-ruby/rainbows-4.4.0"
ruby_add_rdepend ">=dev-ruby/thin-1.2.0"
ruby_add_rdepend ">=dev-ruby/goliath-0"
ruby_add_rdepend ">=dev-ruby/passenger-4.0.0"

