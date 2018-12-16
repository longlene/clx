# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple Ruby client library for twitter streaming API"
HOMEPAGE="http://github.com/voloko/twitter-stream"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0.12.8"
ruby_add_rdepend ">=dev-ruby/simple_oauth-0.1.4"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0.5.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.5.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
