# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Renders and parses JSON/XML/YAML documents from and to Ruby objects"
HOMEPAGE="https://github.com/apotonick/representable/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/uber-0.0.7"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/test_xml-0.1.6"
ruby_add_rdepend ">=dev-ruby/minitest-5.4.1"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.0"
ruby_add_rdepend ">=dev-ruby/mongoid-0"
ruby_add_rdepend ">=dev-ruby/virtus-0"
ruby_add_rdepend ">=dev-ruby/json-1.7.7"

