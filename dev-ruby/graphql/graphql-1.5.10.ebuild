# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A plain-Ruby implementation of GraphQL"
HOMEPAGE="http://github.com/rmosolgo/graphql-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/benchmark-ips-0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.4"
ruby_add_rdepend ">=dev-ruby/concurrent-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/guard-2.12"
ruby_add_rdepend ">=dev-ruby/guard-bundler-2.1"
ruby_add_rdepend ">=dev-ruby/guard-minitest-2.4"
ruby_add_rdepend ">=dev-ruby/guard-rake-0"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-0"
ruby_add_rdepend ">=dev-ruby/listen-3.0.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.9.0"
ruby_add_rdepend ">=dev-ruby/minitest-focus-1.1"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.0"
ruby_add_rdepend ">=dev-ruby/racc-1.4"
ruby_add_rdepend ">=dev-ruby/rails-0"
ruby_add_rdepend ">=dev-ruby/rake-11"
ruby_add_rdepend ">=dev-ruby/rubocop-0.45"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/sequel-0"
ruby_add_rdepend ">=dev-ruby/github-pages-0"

