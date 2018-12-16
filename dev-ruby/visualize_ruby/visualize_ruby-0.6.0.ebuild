# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Turn Ruby code into flow charts"
HOMEPAGE="https://github.com/zeisler/visualize_ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/graphviz-1.0"
ruby_add_rdepend ">=dev-ruby/dissociated_introspection-0.9.1"
ruby_add_rdepend ">=dev-ruby/parser-2.1"

