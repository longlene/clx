# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Unobtrusive nested forms handling, using jQuery"
HOMEPAGE="http://github.com/nathanvda/cocoon"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/json_pure-0"
ruby_add_rdepend ">=dev-ruby/jeweler-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.8.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.8.0"
ruby_add_rdepend ">=dev-ruby/actionpack-4.0.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/generator_spec-0"
ruby_add_rdepend ">=dev-ruby/rubysl-0"
ruby_add_rdepend ">=dev-ruby/rubysl-test-unit-0"
ruby_add_rdepend ">=dev-ruby/psych-0"
ruby_add_rdepend ">=dev-ruby/racc-0"
ruby_add_rdepend ">=dev-ruby/rubinius-developer_tools-0"

