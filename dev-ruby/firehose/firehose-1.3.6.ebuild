# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Firehose is a realtime web application toolkit for building realtime Ruby web applications"
HOMEPAGE="http://firehose.io/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-hiredis-0.2.0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend "=dev-ruby/faraday-0.9.0"
ruby_add_rdepend ">=dev-ruby/faye-websocket-0"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/rspec-2"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/rainbows-4.4.3"
ruby_add_rdepend ">=dev-ruby/thin-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/async_rack_test-0"
ruby_add_rdepend ">=dev-ruby/foreman-0"
ruby_add_rdepend ">=dev-ruby/sprockets-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/capybara-webkit-0"
ruby_add_rdepend ">=dev-ruby/therubyracer-0"

