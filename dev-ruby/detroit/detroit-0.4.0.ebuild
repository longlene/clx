# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Detroit is an advanced lifecycle build system"
HOMEPAGE="http://rubyworks.github.com/detroit"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/facets-0"
ruby_add_rdepend ">=dev-ruby/indexer-0"
ruby_add_rdepend ">=dev-ruby/qed-0"
ruby_add_rdepend ">=dev-ruby/detroit-yard-0"
ruby_add_rdepend ">=dev-ruby/detroit-gem-0"

