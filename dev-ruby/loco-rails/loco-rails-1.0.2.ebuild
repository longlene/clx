# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rails is awesome, but modern web needs Loco-motive"
HOMEPAGE="http://locoframework.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.2"
ruby_add_rdepend ">=dev-ruby/coffee-rails-4.1"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.1"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/bcrypt-3.1"
ruby_add_rdepend ">=dev-ruby/hirb-0.7"
ruby_add_rdepend ">=dev-ruby/sass-rails-5.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.6"
ruby_add_rdepend ">=dev-ruby/launchy-2.4"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-2.50"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.5"

