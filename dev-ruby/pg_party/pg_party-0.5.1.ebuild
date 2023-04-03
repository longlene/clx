# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Migrations and model helpers for creating and managing PostgreSQL 10 partitions"
HOMEPAGE="https://github.com/rkrage/pg_party"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.2"
ruby_add_rdepend ">=dev-ruby/pg-0.20"
ruby_add_rdepend ">=dev-ruby/bundler-1.15"
ruby_add_rdepend ">=dev-ruby/rake-12.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.6"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.2"
ruby_add_rdepend ">=dev-ruby/pry-byebug-3.4"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0.3"
ruby_add_rdepend ">=dev-ruby/appraisal-2.2"
ruby_add_rdepend ">=dev-ruby/combustion-0.7"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.6"
ruby_add_rdepend ">=dev-ruby/timecop-0.9"
ruby_add_rdepend ">=dev-ruby/simplecov-0.15"

