# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ORM for RethinkDB"
HOMEPAGE="http://nobrainer.io"

LICENSE="LGPLv3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rethinkdb-2.3.0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.1.0"
ruby_add_rdepend ">=dev-ruby/activemodel-4.1.0"
ruby_add_rdepend ">=dev-ruby/middleware-0.1.0"
ruby_add_rdepend ">=dev-ruby/symbol_decoration-1.1"

