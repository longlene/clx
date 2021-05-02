# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="JSON API(jsonapi"
HOMEPAGE="http://github.com/Netflix/fast_jsonapi"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/activerecord-4.2"
ruby_add_rdepend ">=dev-ruby/skylight-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.5.0"
ruby_add_rdepend ">=dev-ruby/oj-3.3"
ruby_add_rdepend ">=dev-ruby/rspec-benchmark-0.3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/byebug-0"
ruby_add_rdepend ">=dev-ruby/active_model_serializers-0.10.7"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/jsonapi-rb-0.5.0"
ruby_add_rdepend ">=dev-ruby/jsonapi-serializers-1.0.0"

