# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Universal Ruby library to handle WebSocket protocol"
HOMEPAGE="http://github.com/imanel/websocket-ruby"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


