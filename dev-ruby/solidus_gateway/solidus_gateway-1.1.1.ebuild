# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Additional Payment Gateways for Solidus"
HOMEPAGE="https://solidus.io"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/solidus_core-1.1"
ruby_add_rdepend ">=dev-ruby/activemerchant-1.48"
ruby_add_rdepend ">=dev-ruby/braintree-2.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.4"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.9"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.2.0"

