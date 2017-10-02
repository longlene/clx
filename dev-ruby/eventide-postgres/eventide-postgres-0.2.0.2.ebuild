# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" "
HOMEPAGE="https://github.com/eventide-project/eventide-postgres"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/evt-entity_store-0"
ruby_add_rdepend ">=dev-ruby/evt-consumer-postgres-0"
ruby_add_rdepend ">=dev-ruby/evt-entity_snapshot-postgres-0"
