# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Makes it easy to upgrade any request to a websocket connection in Sinatra"
HOMEPAGE="http://github.com/simulacre/sinatra-websocket"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=www-servers/thin-1.3.1"
ruby_add_rdepend ">=dev-ruby/em-websocket-0.3.6"

