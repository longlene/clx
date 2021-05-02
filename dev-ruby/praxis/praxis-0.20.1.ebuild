# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/rightscale/praxis"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1"
ruby_add_rdepend ">=dev-ruby/mustermann-0"
ruby_add_rdepend ">=dev-ruby/activesupport-3"
ruby_add_rdepend ">=dev-ruby/mime-0"
ruby_add_rdepend ">=dev-ruby/praxis-mapper-4.2"
ruby_add_rdepend ">=dev-ruby/praxis-blueprints-3.2"
ruby_add_rdepend ">=dev-ruby/attributor-5.0.2"
ruby_add_rdepend ">=dev-ruby/thor-0.18"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4"
ruby_add_rdepend ">=dev-ruby/harness-2"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/rake-notes-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-1"
ruby_add_rdepend ">=dev-ruby/pry-stack_explorer-0"
ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/rspec-its-1"
ruby_add_rdepend ">=dev-ruby/rspec-collection_matchers-1"
ruby_add_rdepend ">=dev-ruby/guard-2"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4"
ruby_add_rdepend ">=dev-ruby/guard-bundler-2"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/fuubar-2"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1"
ruby_add_rdepend ">=dev-ruby/coveralls-0"

