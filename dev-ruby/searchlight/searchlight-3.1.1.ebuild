# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Searchlight is a low-magic way to build database searches using an ORM"
HOMEPAGE="https://github.com/nathanl/searchlight"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/named-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/capybara-2.0"
ruby_add_rdepend ">=dev-ruby/actionview-4.1"
ruby_add_rdepend ">=dev-ruby/activemodel-4.1"

