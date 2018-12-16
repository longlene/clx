# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Test your XML with Test::Unit, MiniTest, RSpec, or Cucumber using handy assertions like #assert_xml_equal or #assert_xml_structure_contain"
HOMEPAGE="http://github.com/alovak/test_xml"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/diffy-3.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.3.2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/rspec-core-2.2"

