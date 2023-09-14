# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Neo4j-core provides classes and methods to work with the graph database Neo4j"
HOMEPAGE="https://github.com/neo4jrb/neo4j-core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0"
ruby_add_rdepend ">=dev-ruby/faraday-0.9.0"
ruby_add_rdepend ">=dev-ruby/net-http-persistent-0"
ruby_add_rdepend ">=dev-ruby/httpclient-0"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9.1"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/os-0"
ruby_add_rdepend ">=dev-ruby/zip-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-multi_json-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.29.1"

