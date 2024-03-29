# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc"
HOMEPAGE="https://github.com/dry-rb/dry-types"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/concurrent-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/dry-core-0.4"
ruby_add_rdepend ">=dev-ruby/dry-inflector-0.1"
ruby_add_rdepend ">=dev-ruby/dry-container-0.3"
ruby_add_rdepend ">=dev-ruby/dry-equalizer-0.2"
ruby_add_rdepend ">=dev-ruby/dry-logic-0.4"
