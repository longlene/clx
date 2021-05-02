# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides authentication and authorization services for use with Solidus by using Devise and CanCan"
HOMEPAGE=""

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/solidus_core-1.0.6"
ruby_add_rdepend ">=dev-ruby/devise-4.1"
ruby_add_rdepend ">=dev-ruby/devise-encryptable-0.2.0"
ruby_add_rdepend ">=dev-ruby/deface-1.0.0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/solidus_backend-1.0.6"
ruby_add_rdepend ">=dev-ruby/solidus_frontend-1.0.6"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0.11.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-0"
ruby_add_rdepend ">=dev-ruby/shoulda-matchers-3.1.1"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.4"
ruby_add_rdepend ">=dev-ruby/capybara-2.7.1"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.5"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.5.3"
ruby_add_rdepend ">=dev-ruby/capybara-screenshot-0"

