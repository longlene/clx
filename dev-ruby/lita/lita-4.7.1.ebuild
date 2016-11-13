# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ChatOps for Ruby"
HOMEPAGE="https://github.com/jimmycuadra/lita"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/faraday-0.8.7"
ruby_add_rdepend ">=dev-ruby/http_router-0.11.2"
ruby_add_rdepend ">=dev-ruby/ice_nine-0.11.0"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.9"
ruby_add_rdepend ">=dev-ruby/multi_json-1.7.7"
ruby_add_rdepend ">=dev-ruby/puma-2.7.1"
ruby_add_rdepend ">=dev-ruby/rack-1.5.2"
ruby_add_rdepend ">=dev-ruby/rb-readline-0.5.1"
ruby_add_rdepend ">=dev-ruby/redis-namespace-1.3.0"
ruby_add_rdepend ">=dev-ruby/thor-0.18.1"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.33.0"

