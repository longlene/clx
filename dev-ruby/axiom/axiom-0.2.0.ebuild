# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simplifies querying of structured data using relational algebra"
HOMEPAGE="https://github.com/dkubb/axiom"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/abstract_type-0.0.7"
ruby_add_rdepend ">=dev-ruby/adamantium-0.2.0"
ruby_add_rdepend ">=dev-ruby/axiom-types-0.1.0"
ruby_add_rdepend ">=dev-ruby/descendants_tracker-0.0.3"
ruby_add_rdepend ">=dev-ruby/equalizer-0.0.9"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"

