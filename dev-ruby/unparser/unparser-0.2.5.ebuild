# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Generate equivalent source for parser gem AST nodes"
HOMEPAGE="http://github.com/mbj/unparser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/abstract_type-0.0.7"
ruby_add_rdepend ">=dev-ruby/adamantium-0.2.0"
ruby_add_rdepend ">=dev-ruby/equalizer-0.0.9"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.2.5"
ruby_add_rdepend ">=dev-ruby/concord-0.1.5"
ruby_add_rdepend ">=dev-ruby/parser-2.3.0"
ruby_add_rdepend ">=dev-ruby/procto-0.0.2"
ruby_add_rdepend ">=dev-ruby/anima-0.3.0"
ruby_add_rdepend ">=dev-ruby/devtools-0.1.3"
ruby_add_rdepend ">=dev-ruby/morpher-0.2.6"

