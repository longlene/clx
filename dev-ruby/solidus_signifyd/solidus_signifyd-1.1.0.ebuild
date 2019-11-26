# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Solidus extension for communicating with Signifyd to check orders for fraud"
HOMEPAGE="http://www.bonobos.com"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/active_model_serializers-0.9.3"
ruby_add_rdepend ">=dev-ruby/signifyd-0.1.5"
ruby_add_rdepend ">=dev-ruby/solidus-1.0"
ruby_add_rdepend ">=dev-ruby/devise-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.4"
ruby_add_rdepend ">=dev-ruby/json-schema-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0"
ruby_add_rdepend ">=dev-ruby/factory_girl-0"
ruby_add_rdepend ">=dev-ruby/ffaker-0"

