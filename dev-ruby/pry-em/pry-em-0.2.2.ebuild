# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="em! is a synchronous wrapper around deferrables, so that you can interact with them as though they were normal function calls"
HOMEPAGE="http://github.com/ConradIrwin/pry-em"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">dev-ruby/pry-0.9.8"
ruby_add_rdepend ">=dev-ruby/eventmachine-0"

