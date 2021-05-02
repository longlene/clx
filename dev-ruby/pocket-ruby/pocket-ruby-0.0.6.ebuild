# Distributed under the terms of the GNU General Public License v2

EAPI=7
#USE_RUBY="ruby25 ruby26"
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby wrapper for the Pocket API v3 (Add, Modify and Retrieve)"
HOMEPAGE="https://github.com/turadg/pocket-ruby"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.3.3"
ruby_add_rdepend ">=dev-ruby/multi_xml-0"
ruby_add_rdepend ">=dev-ruby/faraday-0.7"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0"
ruby_add_rdepend ">=dev-ruby/hashie-0.4.0"

all_ruby_prepare() {
	sed -e '/git ls-files/d' -i ${PN}.gemspec
}
