# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Helps to save your eyes, when reading hardcore SQL requests in console"
HOMEPAGE="https://github.com/kvokka/pp_sql"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/anbt-sql-formatter-0.0.5"

