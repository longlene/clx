# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="      Drake is an auto-parallelizing branch of Rake, a Make-like program
      implemented in Ruby"
HOMEPAGE="http://quix.github.com/rake"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/comp_tree-1.1.3"
ruby_add_rdepend ">=dev-ruby/minitest-2.1"
ruby_add_rdepend ">=dev-ruby/session-2.4"
ruby_add_rdepend ">=dev-ruby/flexmock-0.8.11"

