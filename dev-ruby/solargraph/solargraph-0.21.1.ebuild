# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="IDE tools for code completion and inline documentation"
HOMEPAGE="http://solargraph.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/parser-2.4"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/yard-0.9"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.2"
ruby_add_rdepend ">=dev-ruby/reverse_markdown-1.0"
ruby_add_rdepend ">=dev-ruby/kramdown-0"
ruby_add_rdepend ">=dev-ruby/htmlentities-4.3"
ruby_add_rdepend ">=dev-ruby/coderay-1.1"
ruby_add_rdepend ">=dev-ruby/rubocop-0.51"
ruby_add_rdepend ">=dev-ruby/tilt-2.0"
