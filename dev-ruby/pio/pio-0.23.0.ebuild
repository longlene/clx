# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pure ruby packet parser and generator"
HOMEPAGE="http://github.com/trema/pio"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bindata-2.1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.10.5"
ruby_add_rdepend ">=dev-ruby/pry-0.10.1"
ruby_add_rdepend ">=dev-ruby/guard-2.12.6"
ruby_add_rdepend ">=dev-ruby/guard-bundler-2.1.0"
ruby_add_rdepend ">=dev-ruby/guard-cucumber-1.6.0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.5.2"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-1.2.0"
ruby_add_rdepend ">=dev-ruby/rb-fchange-0.0.6"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9.5"
ruby_add_rdepend ">=dev-ruby/rb-inotify-0.9.5"
ruby_add_rdepend ">=dev-ruby/terminal-notifier-guard-1.6.4"
ruby_add_rdepend ">=dev-ruby/inch-0.6.3"
ruby_add_rdepend ">=dev-ruby/relish-0.7.1"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.6"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.4.7"
ruby_add_rdepend ">=dev-ruby/coveralls-0.8.2"
ruby_add_rdepend ">=dev-ruby/cucumber-2.0.0"
ruby_add_rdepend ">=dev-ruby/flay-2.6.1"
ruby_add_rdepend ">=dev-ruby/flog-4.3.2"
ruby_add_rdepend ">=dev-ruby/reek-2.2.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.3.0"
ruby_add_rdepend ">=dev-ruby/rspec-given-3.7.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.32.1"

