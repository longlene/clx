# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Apartment allows Rack applications to deal with database multitenancy through ActiveRecord"
HOMEPAGE="https://github.com/influitive/apartment"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.1.2"
ruby_add_rdepend ">=dev-ruby/rack-1.3.6"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.4"
ruby_add_rdepend ">=dev-ruby/capybara-2.0"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3.10"
ruby_add_rdepend ">=dev-ruby/pg-0.11.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

