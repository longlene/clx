# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Generates action methods to provide clean tables"
HOMEPAGE="http://github.com/ekylibre/active_list"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3.2"
ruby_add_rdepend ">=dev-ruby/arel-5.0.0"
ruby_add_rdepend ">=dev-ruby/code_string-0.0.0"
ruby_add_rdepend ">=dev-ruby/rubyzip-1.0"
ruby_add_rdepend ">=dev-ruby/i18n-complements-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

