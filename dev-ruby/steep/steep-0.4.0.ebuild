# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gradual Typing for Ruby"
HOMEPAGE="https://github.com/soutaro/steep"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.13"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/racc-1.4"
ruby_add_rdepend ">=dev-ruby/parser-2.4"
ruby_add_rdepend ">=dev-ruby/ast_utils-0.1.0"
ruby_add_rdepend ">=dev-ruby/activesupport-5.1.0"
ruby_add_rdepend ">=dev-ruby/rainbow-2.2.2"

