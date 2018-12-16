# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Flex is the ultimate ruby client for elasticsearch"
HOMEPAGE="http://github.com/ddnexus/flex"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/multi_json-1.3.4"
ruby_add_rdepend "=dev-ruby/progressbar-0.12.0"
ruby_add_rdepend ">=dev-ruby/dye-0.1.4"

