# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Additional Payment Gateways for Spree Commerce"
HOMEPAGE="http://www.spreecommerce.com"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/spree_core-3.1.0"
ruby_add_rdepend ">=dev-ruby/braintree-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-4.0.0"
ruby_add_rdepend "=dev-ruby/database_cleaner-1.2.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.4"
ruby_add_rdepend ">=dev-ruby/ffaker-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.6.0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rspec-activemodel-mocks-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.99"
ruby_add_rdepend ">=dev-ruby/bootstrap-sass-3.3.5.1"
ruby_add_rdepend ">=dev-ruby/sass-rails-3.2"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

