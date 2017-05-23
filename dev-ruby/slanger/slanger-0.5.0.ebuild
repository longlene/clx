# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A websocket service compatible with Pusher libraries"
HOMEPAGE="https://github.com/stevegraham/slanger"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-hiredis-0.2.0"
ruby_add_rdepend ">=dev-ruby/em-websocket-0.5.1"
ruby_add_rdepend ">=dev-ruby/rack-1.4.5"
ruby_add_rdepend ">=dev-ruby/rack-fiber_pool-0.9.2"
ruby_add_rdepend ">=dev-ruby/signature-0.1.6"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2.1"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4.4"
ruby_add_rdepend ">=dev-ruby/thin-1.6.0"
ruby_add_rdepend ">=dev-ruby/em-http-request-0.3.0"
ruby_add_rdepend ">=dev-ruby/oj-2.12.9"
ruby_add_rdepend ">=dev-ruby/rspec-2.12.0"
ruby_add_rdepend ">=dev-ruby/pusher-0.14.2"
ruby_add_rdepend ">=dev-ruby/haml-3.1.2"
ruby_add_rdepend ">=dev-ruby/timecop-0.3.5"
ruby_add_rdepend ">=dev-ruby/webmock-1.8.7"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.2"
ruby_add_rdepend ">=dev-ruby/pry-0.10.1"
ruby_add_rdepend ">=dev-ruby/pry-byebug-2.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-10.4.2"

