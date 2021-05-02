# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby implementation of the Discord (https://discordapp"
HOMEPAGE="https://github.com/meew0/discordrb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend ">=dev-ruby/opus-ruby-0"
ruby_add_rdepend ">=dev-ruby/websocket-client-simple-0.3.0"
ruby_add_rdepend ">=dev-ruby/rbnacl-3.4.0"
ruby_add_rdepend ">=dev-ruby/discordrb-webhooks-3.2.0.1"
