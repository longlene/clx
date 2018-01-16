# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sinja is a Sinatra extension for quickly building RESTful,
{json:api}-compliant web services, leveraging the excellent
JSONAPI::Serializers gem for payload serialization"
HOMEPAGE="http://sinja-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.2.8"
ruby_add_rdepend ">=dev-ruby/json-1.8.3"
ruby_add_rdepend ">=dev-ruby/jsonapi-serializers-0.16.2"
ruby_add_rdepend ">=dev-ruby/sinatra-2.0.0"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-2.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/minitest-5.9"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-1.4"
ruby_add_rdepend ">=dev-ruby/rack-test-0.7.0"
ruby_add_rdepend ">=dev-ruby/rake-12.0"
ruby_add_rdepend "<=dev-ruby/sequel-4.49"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"

