# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A reactive Ruby web framework where your Ruby code runs on both the server and the client (via Opal)"
HOMEPAGE="http://voltframework.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.19.0"
ruby_add_rdepend ">=dev-ruby/pry-0.10.1"
ruby_add_rdepend ">=dev-ruby/rack-1.5.0"
ruby_add_rdepend ">=dev-ruby/sass-3.4.15"
ruby_add_rdepend ">=dev-ruby/listen-3.0.1"
ruby_add_rdepend ">=dev-ruby/configurations-2.0.0"
ruby_add_rdepend ">=dev-ruby/opal-0.8.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/faye-websocket-0.10.0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-1.2.1"
ruby_add_rdepend "=dev-ruby/concurrent-ruby-0.8.0"
ruby_add_rdepend ">=dev-ruby/bcrypt-3.1.9"
ruby_add_rdepend ">=dev-ruby/rspec-3.2.0"
ruby_add_rdepend ">=dev-ruby/opal-rspec-0.4.3"
ruby_add_rdepend ">=dev-ruby/capybara-2.4.4"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-2.47.1"
ruby_add_rdepend ">=dev-ruby/chromedriver-helper-1.0.0"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.5.0"
ruby_add_rdepend ">=dev-ruby/thin-1.6.3"
ruby_add_rdepend ">=dev-ruby/coveralls-0.8.1"
ruby_add_rdepend ">=dev-ruby/guard-2.12.7"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.3.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0.4"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.31.0"

