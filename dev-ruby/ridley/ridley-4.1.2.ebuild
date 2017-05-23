# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A reliable Chef API client with a clean syntax"
HOMEPAGE="https://github.com/RiotGames/ridley"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-0"
ruby_add_rdepend ">=dev-ruby/varia_model-0.4"
ruby_add_rdepend ">=dev-ruby/buff-config-1.0"
ruby_add_rdepend ">=dev-ruby/buff-extensions-1.0"
ruby_add_rdepend ">=dev-ruby/buff-ignore-1.1"
ruby_add_rdepend ">=dev-ruby/buff-shell_out-0.1"
ruby_add_rdepend ">=dev-ruby/celluloid-0.16.0"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.16.1"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/faraday-0.9.0"
ruby_add_rdepend ">=dev-ruby/hashie-2.0.2"
ruby_add_rdepend ">=dev-ruby/json-1.7.7"
ruby_add_rdepend ">=dev-ruby/mixlib-authentication-1.3.0"
ruby_add_rdepend ">=dev-ruby/net-http-persistent-2.8"
ruby_add_rdepend ">=dev-ruby/retryable-2.0.0"
ruby_add_rdepend ">=dev-ruby/semverse-1.1"
ruby_add_rdepend ">=dev-ruby/buff-ruby_engine-0.1"

