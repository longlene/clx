# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides authentication and authorization services for use with Spree by using Devise and CanCan"
HOMEPAGE="http://spreecommerce.com"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/devise-3.5.4"
ruby_add_rdepend "=dev-ruby/devise-encryptable-0.1.2"
ruby_add_rdepend ">=dev-ruby/spree_core-3.1.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.4.1"
ruby_add_rdepend ">=dev-ruby/coffee-rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.2.0"
ruby_add_rdepend ">=dev-ruby/email_spec-1.5.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.4"
ruby_add_rdepend ">=dev-ruby/ffaker-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.5"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.4.1"
ruby_add_rdepend ">=dev-ruby/shoulda-matchers-2.6.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9.0"
ruby_add_rdepend ">=dev-ruby/spree_backend-3.1.0"
ruby_add_rdepend ">=dev-ruby/spree_frontend-3.1.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

