# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pry state lets you to see the values of the instance and local variables in a pry session"
HOMEPAGE="https://github.com/SudhagarS/pry-state"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/rspec-core-3.3"
ruby_add_rdepend ">=dev-ruby/pry-nav-0.2.4"
ruby_add_rdepend ">=dev-ruby/guard-2.13"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.6"
ruby_add_rdepend "<dev-ruby/pry-0.9.10"

