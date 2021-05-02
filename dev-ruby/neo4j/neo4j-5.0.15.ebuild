# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Neo4j OGM (Object-Graph-Mapper) for use in Ruby on Rails and Rack frameworks heavily inspired by ActiveRecord"
HOMEPAGE="https://github.com/neo4jrb/neo4j/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/orm_adapter-0.5.0"
ruby_add_rdepend ">=dev-ruby/activemodel-4"
ruby_add_rdepend ">=dev-ruby/activesupport-4"
ruby_add_rdepend ">=dev-ruby/active_attr-0.8"
ruby_add_rdepend ">=dev-ruby/neo4j-core-5.0.1"
ruby_add_rdepend ">=dev-ruby/railties-4"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/os-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.29.1"

