# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Structure many real-time application concerns into channels over a single WebSocket connection"
HOMEPAGE="http://rubyonrails.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/actionpack-5.0.0"
ruby_add_rdepend ">=dev-ruby/nio4r-1.2"
ruby_add_rdepend ">=dev-ruby/websocket-driver-0.6.1"
ruby_add_rdepend ">=dev-ruby/blade-0.5.1"

