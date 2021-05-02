# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Quick way to inspect your Rails database, see content of tables, filter, export them to CSV, Excel, EXPLAIN SQL and run SQL queries"
HOMEPAGE="https://github.com/igorkasyanchuk/rails_db"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-5.0.0"
ruby_add_rdepend ">=dev-ruby/codemirror-rails-0"
ruby_add_rdepend ">=dev-ruby/terminal-table-0"
ruby_add_rdepend ">=dev-ruby/simple_form-0"
ruby_add_rdepend ">=dev-ruby/ransack-0"
ruby_add_rdepend ">=dev-ruby/kaminari-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend "<=dev-ruby/mysql2-0.3.20"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/axlsx_rails-0"
ruby_add_rdepend ">=dev-ruby/will_paginate-3.0.6"
ruby_add_rdepend "<dev-ruby/mime-types-3.0"

