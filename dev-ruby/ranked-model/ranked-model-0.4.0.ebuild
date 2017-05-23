# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ranked-model is a modern row sorting library built for Rails 3 & 4"
HOMEPAGE="https://github.com/mixonic/ranked-model"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.1.12"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.7"
ruby_add_rdepend ">=dev-ruby/genspec-0.2.8"
ruby_add_rdepend ">=dev-ruby/mocha-0.14.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.2.0"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"

