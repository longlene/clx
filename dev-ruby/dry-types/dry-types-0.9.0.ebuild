# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc"
HOMEPAGE="https://github.com/dryrb/dry-types"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/concurrent-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/dry-core-0.1"
ruby_add_rdepend ">=dev-ruby/dry-container-0.3"
ruby_add_rdepend ">=dev-ruby/dry-equalizer-0.2"
ruby_add_rdepend ">=dev-ruby/dry-configurable-0.1"
ruby_add_rdepend ">=dev-ruby/dry-logic-0.4"
ruby_add_rdepend ">=dev-ruby/inflecto-0.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-11.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/dry-monads-0.2"

