# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby20 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby client for the NATS Streaming messaging system"
HOMEPAGE="https://nats.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nats-pure-0"
ruby_add_rdepend ">=dev-ruby/google-protobuf-3"

