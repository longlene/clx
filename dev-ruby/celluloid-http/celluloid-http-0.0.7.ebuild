# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Http requests for celluloid"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/turn-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"

