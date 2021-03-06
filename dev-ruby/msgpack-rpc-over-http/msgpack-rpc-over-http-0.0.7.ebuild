# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library provides MessagePack-RPC via HTTP"
HOMEPAGE="https://github.com/authorNari/msgpack-rpc-over-http"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/msgpack-0.5.11"
ruby_add_rdepend ">=dev-ruby/celluloid-0.16.0"
ruby_add_rdepend ">=dev-ruby/httpclient-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/test-unit-3.0"

