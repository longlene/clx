# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="                                       U

  U extends Ruby’s Unicode support"
HOMEPAGE="http://disu.se/software/u-1.0/"

LICENSE="LGPLv3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/inventory-1.5"
ruby_add_rdepend ">=dev-ruby/inventory-rake-1.6"
ruby_add_rdepend ">=dev-ruby/inventory-rake-tasks-yard-1.4"
ruby_add_rdepend ">=dev-ruby/lookout-3.0"
ruby_add_rdepend ">=dev-ruby/lookout-rake-3.1"
ruby_add_rdepend ">=dev-ruby/yard-0.8.0"
ruby_add_rdepend ">=dev-ruby/yard-heuristics-1.2"

