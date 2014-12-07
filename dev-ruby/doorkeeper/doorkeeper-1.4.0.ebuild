# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Doorkeeper is an OAuth 2 provider for Rails"
HOMEPAGE="https://github.com/doorkeeper-gem/doorkeeper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.5"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.99.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.3.0"
ruby_add_rdepend ">=dev-ruby/generator_spec-0.9.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.4.0"
ruby_add_rdepend ">=dev-ruby/timecop-0.7.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.3.0"
ruby_add_rdepend ">=dev-ruby/rspec-activemodel-mocks-1.0.0"
ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-3.0.1"
ruby_add_rdepend ">=dev-ruby/pry-0.10.0"

