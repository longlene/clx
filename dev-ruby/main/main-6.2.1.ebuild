# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="a class factory and dsl for generating command line programs real quick"
HOMEPAGE="https://github.com/ahoward/main"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/chronic-0.6"
ruby_add_rdepend ">=dev-ruby/fattr-2.2"
ruby_add_rdepend ">=dev-ruby/arrayfields-4.7"
ruby_add_rdepend ">=dev-ruby/map-6.1"

