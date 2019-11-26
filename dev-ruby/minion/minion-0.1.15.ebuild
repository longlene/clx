# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Super simple job queue over AMQP"
HOMEPAGE="http://github.com/orionz/minion"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/amqp-0.6.7"
ruby_add_rdepend ">=dev-ruby/bunny-0.6.0"
ruby_add_rdepend ">=dev-ruby/json-1.2.0"

