# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    acts_as_xlsx lets you turn any ActiveRecord::Base inheriting class into an excel spreadsheet"
HOMEPAGE="https://github.com/randym/acts_as_xlsx"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/axlsx-1.0.13"
ruby_add_rdepend ">=dev-ruby/activerecord-2.3.9"
ruby_add_rdepend ">=dev-ruby/i18n-0.4.1"
ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.5"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"

