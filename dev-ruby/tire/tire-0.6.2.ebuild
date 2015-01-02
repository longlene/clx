# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="   Tire is a Ruby client for the Elasticsearch search engine/database"
HOMEPAGE="http://github.com/karmi/tire"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rest-client-1.6"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0"
ruby_add_rdepend ">=dev-ruby/hashr-0.0.19"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/ansi-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/shoulda-context-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.13"
ruby_add_rdepend ">=dev-ruby/minitest-2.12"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/active_model_serializers-0"
ruby_add_rdepend ">=dev-ruby/mongoid-2.2"
ruby_add_rdepend ">=dev-ruby/redis-persistence-0"
ruby_add_rdepend ">=dev-ruby/faraday-0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/bson_ext-0"
ruby_add_rdepend ">=dev-ruby/curb-0"
ruby_add_rdepend ">=dev-ruby/oj-0"
ruby_add_rdepend ">=dev-ruby/turn-0.9"

