# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="textutils - Text Filters, Helpers, Readers and More"
HOMEPAGE="https://github.com/textkit/textutils"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/props-1.1.2"
ruby_add_rdepend ">=dev-ruby/logutils-0.6.1"
ruby_add_rdepend ">=dev-ruby/rubyzip-1.0.0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.14"

