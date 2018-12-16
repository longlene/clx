# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby Object Mapper"
HOMEPAGE="http://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/adamantium-0.2"
ruby_add_rdepend ">=dev-ruby/addressable-2.3.3"
ruby_add_rdepend ">=dev-ruby/axiom-0.2"
ruby_add_rdepend ">=dev-ruby/axiom-optimizer-0.2"
ruby_add_rdepend ">=dev-ruby/charlatan-0.1"
ruby_add_rdepend ">=dev-ruby/concord-0.1"
ruby_add_rdepend ">=dev-ruby/morpher-0.2"

