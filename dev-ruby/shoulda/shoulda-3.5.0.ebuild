# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Making tests easy on the fingers and eyes"
HOMEPAGE="https://github.com/thoughtbot/shoulda"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/shoulda-context-1.0"
ruby_add_rdepend ">=dev-ruby/shoulda-matchers-1.4.1"
ruby_add_rdepend ">=dev-ruby/appraisal-0.4.0"
ruby_add_rdepend ">=dev-ruby/rails-3.0.12"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.2"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.7.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.1.0"
ruby_add_rdepend ">=dev-ruby/aruba-0.4.11"

