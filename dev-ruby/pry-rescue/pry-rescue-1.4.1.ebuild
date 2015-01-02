# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Allows you to wrap code in Pry::rescue{ } to open a pry session at any unhandled exceptions"
HOMEPAGE="https://github.com/ConradIrwin/pry-rescue"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/interception-0.5"
ruby_add_rdepend ">=dev-ruby/pry-stack_explorer-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"

