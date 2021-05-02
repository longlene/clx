# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/socketry/falcon"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/http-protocol-0.10.0"
ruby_add_rdepend ">=dev-ruby/async-io-1.9"
ruby_add_rdepend ">=dev-ruby/async-http-0.37.2"
ruby_add_rdepend ">=dev-ruby/async-container-0.8.0"
ruby_add_rdepend ">=dev-ruby/rack-1.0"
ruby_add_rdepend ">=dev-ruby/samovar-1.3"
ruby_add_rdepend ">=dev-ruby/localhost-1.1"

