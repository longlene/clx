# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An earth-simulation environment with ActiveRecord models and data"
HOMEPAGE="https://github.com/brighterplanet/earth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/cohort_analysis-0"
ruby_add_rdepend ">=dev-ruby/conversions-0"
ruby_add_rdepend ">=dev-ruby/data_miner-2.4.0"
ruby_add_rdepend ">=dev-ruby/falls_back_on-0"
ruby_add_rdepend ">=dev-ruby/fixed_width-multibyte-0"
ruby_add_rdepend ">=dev-ruby/fuzzy_match-1.3.3"
ruby_add_rdepend ">=dev-ruby/remote_table-2.1.0"
ruby_add_rdepend ">=dev-ruby/table_warnings-1.0.1"
ruby_add_rdepend ">=dev-ruby/to_regexp-0"
ruby_add_rdepend ">=dev-ruby/weighted_average-1.0.2"
ruby_add_rdepend ">=dev-ruby/timeframe-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/charisma-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/dbf-0"
ruby_add_rdepend ">=dev-ruby/factory_girl-0"
ruby_add_rdepend ">=dev-ruby/georuby-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/sandbox-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

