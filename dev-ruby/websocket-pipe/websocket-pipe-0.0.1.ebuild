# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pipe data from a Ruby IO stream to a Websocket server, broadcasting to all clients"
HOMEPAGE="https://github.com/mattbaker/websocket-pipe"

LICENSE="Apache License, Version 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/em-websocket-0.5.1"

