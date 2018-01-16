# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Querly is a query language and tool to find out method calls from Ruby programs"
HOMEPAGE="https://github.com/soutaro/querly"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.12"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend "=dev-ruby/racc-1.4.14"
ruby_add_rdepend "=dev-ruby/unification_assertion-0.0.1"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/parser-2.4.0"
ruby_add_rdepend ">=dev-ruby/rainbow-2.1"
ruby_add_rdepend ">=dev-ruby/activesupport-5.0"

