# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gives you an RubyEngine class that simplifies checking for your Ruby implementation"
HOMEPAGE="https://github.com/janlelis/ruby_engine"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rdoc-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.4"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0.2"

