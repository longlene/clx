# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  A Ruby implemenation of the well-known graph library called "networkx""
HOMEPAGE="https://github.com/athityakumar/networkx.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.15"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-its-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.40.0"
ruby_add_rdepend ">=dev-ruby/rubocop-rspec-0"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0"
ruby_add_rdepend ">=dev-ruby/saharspec-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"

