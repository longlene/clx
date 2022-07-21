# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby30 ruby31"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Opal is a Ruby to JavaScript compiler"
HOMEPAGE="https://opalrb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sourcemap-0.1.0"
ruby_add_rdepend ">=dev-ruby/hike-1.2"
ruby_add_rdepend ">=dev-ruby/ast-2.3.0"
ruby_add_rdepend ">=dev-ruby/parser-2.3.3.1"

