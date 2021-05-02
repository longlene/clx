# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Strategies for cleaning databases"
HOMEPAGE="http://github.com/DatabaseCleaner/database_cleaner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/json_pure-0"
ruby_add_rdepend ">=dev-ruby/activerecord-mysql2-adapter-0"
ruby_add_rdepend ">=dev-ruby/activerecord-0"
ruby_add_rdepend ">=dev-ruby/datamapper-0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-0"
ruby_add_rdepend ">=dev-ruby/mongoid-0"
ruby_add_rdepend ">=dev-ruby/tzinfo-0"
ruby_add_rdepend ">=dev-ruby/mongoid-tree-0"
ruby_add_rdepend ">=dev-ruby/mongo_mapper-0"
ruby_add_rdepend ">=dev-ruby/moped-0"
ruby_add_rdepend ">=dev-ruby/neo4j-core-0"
ruby_add_rdepend ">=dev-ruby/couch_potato-0"
ruby_add_rdepend ">=dev-ruby/sequel-3.21.0"
ruby_add_rdepend ">=dev-ruby/ohm-0.1.3"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.14.2"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/mongo_ext-0"
ruby_add_rdepend ">=dev-ruby/bson_ext-0"
ruby_add_rdepend ">=dev-ruby/mysql-2.9.1"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

