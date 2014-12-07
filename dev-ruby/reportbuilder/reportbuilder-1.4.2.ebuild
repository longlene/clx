# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Report Abstract Interface"
HOMEPAGE="http://ruby-statsample.rubyforge.org/reportbuilder/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/clbustos-rtf-0.4.0"
ruby_add_rdepend ">=dev-ruby/text-table-1.2"
ruby_add_rdepend ">=dev-ruby/prawn-0.8.4"
ruby_add_rdepend ">=dev-ruby/prawn-svg-0.9.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"

