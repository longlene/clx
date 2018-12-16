# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A GraphQL server implementation for Ruby"
HOMEPAGE="http://github.com/rmosolgo/graphql-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.4"
ruby_add_rdepend ">=dev-ruby/guard-2.12"
ruby_add_rdepend ">=dev-ruby/guard-bundler-2.1"
ruby_add_rdepend ">=dev-ruby/guard-minitest-2.4"
ruby_add_rdepend ">=dev-ruby/guard-rake-0"
ruby_add_rdepend ">=dev-ruby/listen-3.0.0"
ruby_add_rdepend ">=dev-ruby/minitest-5"
ruby_add_rdepend ">=dev-ruby/minitest-focus-1.1"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.0"
ruby_add_rdepend ">=dev-ruby/racc-1.4"
ruby_add_rdepend ">=dev-ruby/rake-11.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.44"
ruby_add_rdepend ">=dev-ruby/activerecord-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/sequel-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/github-pages-0"

