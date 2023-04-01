# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A multi-threaded WebSocket client, i"
HOMEPAGE="http://github.com/zcourts/websocket-td"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/websocket-1.1.1"
ruby_add_rdepend ">dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/shoulda-2.11.3"
ruby_add_rdepend ">=dev-ruby/test-unit-2.5.5"

