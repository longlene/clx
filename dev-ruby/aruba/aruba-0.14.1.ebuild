# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Extension for popular TDD and BDD frameworks like "Cucumber", "RSpec" and "Minitest" to make testing commandline applications meaningful, easy and fun"
HOMEPAGE="http://github.com/cucumber/aruba"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cucumber-1.3.19"
ruby_add_rdepend ">=dev-ruby/childprocess-0.5.6"
ruby_add_rdepend ">=dev-ruby/ffi-1.9.10"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-2.99"
ruby_add_rdepend ">=dev-ruby/contracts-0.9"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/bundler-1.11"

