# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RAML is a Ruby-syntax-based data language"
HOMEPAGE="http://rubyworks.github.com/raml"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/blankslate-0"
ruby_add_rdepend ">=dev-ruby/detroit-0"
ruby_add_rdepend ">=dev-ruby/qed-0"

