# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Guard::RSpec automatically run your specs (much like autotest)"
HOMEPAGE="https://rubygems.org/gems/guard-rspec"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/guard-2.1"
ruby_add_rdepend "<dev-ruby/rspec-4.0, >= 2.14"
ruby_add_rdepend "<dev-ruby/bundler-2.0, >= 1.3.5"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/launchy-2.4"

