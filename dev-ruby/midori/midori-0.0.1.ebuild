# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Midori is an extensible content manager for websites"
HOMEPAGE="https://github.com/lacroixdesign/midori"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3.2.12"
ruby_add_rdepend ">=dev-ruby/jquery-rails-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

