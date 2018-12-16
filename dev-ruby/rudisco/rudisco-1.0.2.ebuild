# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/Medvedu/rudisco"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-12.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.13"
ruby_add_rdepend ">=dev-ruby/sequel-4.42.1"
ruby_add_rdepend ">=dev-ruby/thor-0.19.4"
ruby_add_rdepend ">=dev-ruby/command_line_reporter-3.0"

