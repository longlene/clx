# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Database Toolkit for Ruby"
HOMEPAGE="http://sequel.jeremyevans.net"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.7.0"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-0"
ruby_add_rdepend ">=dev-ruby/minitest-shared_description-0"
ruby_add_rdepend ">=dev-ruby/tzinfo-0"
ruby_add_rdepend ">=dev-ruby/activemodel-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"

