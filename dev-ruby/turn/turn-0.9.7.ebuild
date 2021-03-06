# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Turn provides a set of alternative runners for MiniTest, both colorful and informative"
HOMEPAGE="http://rubygems.org/gems/turn"

LICENSE="MIT MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ansi-0"
ruby_add_rdepend ">=dev-ruby/minitest-4"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/indexer-0"
ruby_add_rdepend ">=dev-ruby/mast-0"

