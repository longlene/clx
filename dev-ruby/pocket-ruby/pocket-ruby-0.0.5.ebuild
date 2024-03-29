# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby wrapper for the Pocket API v3 (Add, Modify and Retrieve)"
HOMEPAGE="https://github.com/turadg/pocket-ruby"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.3.3"
ruby_add_rdepend ">=dev-ruby/multi_xml-0"
ruby_add_rdepend ">=dev-ruby/faraday-0.7"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.8"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0.3"
ruby_add_rdepend ">=dev-ruby/hashie-0.4.0"

