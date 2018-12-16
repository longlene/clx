# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Markdown Engine Wrapper - Use Your Markdown Library of Choice"
HOMEPAGE="https://github.com/rubylibs/markdown"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/props-1.1.2"
ruby_add_rdepend ">=dev-ruby/textutils-0.10.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.5.0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.13"

