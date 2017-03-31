# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Track changes to your models, for auditing or versioning"
HOMEPAGE="https://github.com/airblade/paper_trail"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.0"
ruby_add_rdepend ">=dev-ruby/request_store-1.1"
ruby_add_rdepend ">=dev-ruby/appraisal-2.1"
ruby_add_rdepend ">=dev-ruby/rake-10.4.2"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5.0"
ruby_add_rdepend ">=dev-ruby/ffaker-2.1.0"
ruby_add_rdepend "<dev-ruby/railties-4.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.3"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.5"
ruby_add_rdepend ">=dev-ruby/generator_spec-0.9.3"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.2"
ruby_add_rdepend ">=dev-ruby/pry-nav-0.2.4"
ruby_add_rdepend ">=dev-ruby/rubocop-0.41.1"
ruby_add_rdepend ">=dev-ruby/timecop-0.8.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.2"
ruby_add_rdepend ">=dev-ruby/pg-0.19.0"
ruby_add_rdepend ">=dev-ruby/mysql2-0.4.2"

