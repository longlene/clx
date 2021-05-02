# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby on Rails integrations for Elasticsearch"
HOMEPAGE="https://github.com/elasticsearch/elasticsearch-rails/"

LICENSE="Apache 2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/elasticsearch-extensions-0"
ruby_add_rdepend ">=dev-ruby/elasticsearch-model-0"
ruby_add_rdepend ">=dev-ruby/oj-0"
ruby_add_rdepend ">dev-ruby/rails-3.0"
ruby_add_rdepend ">=dev-ruby/lograge-0"
ruby_add_rdepend ">=dev-ruby/minitest-4.2"
ruby_add_rdepend ">=dev-ruby/shoulda-context-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/turn-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/ci_reporter-1.9"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/cane-0"
ruby_add_rdepend ">=dev-ruby/require-prof-0"

