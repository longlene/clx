# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Automate Vim with Ruby to allow for TDD/BDD of Vim plugins and scripts"
HOMEPAGE="https://github.com/mrmargolis/robot-vim"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.5.0"
ruby_add_rdepend ">=dev-ruby/autotest-0"
ruby_add_rdepend ">=dev-ruby/uuid-2.3.1"

