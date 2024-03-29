# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Event-Oriented Autonomous Services Toolkit"
HOMEPAGE="https://github.com/eventide-project/eventide-event_store"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/evt-entity_store-0"
ruby_add_rdepend ">=dev-ruby/evt-consumer-event_store-0"
ruby_add_rdepend ">=dev-ruby/evt-entity_snapshot-event_store-0"

