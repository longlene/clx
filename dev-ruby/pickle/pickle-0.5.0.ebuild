# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Easy model creation and reference in your cucumber features"
HOMEPAGE="https://github.com/ianwhite/pickle"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cucumber-0.8"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/git-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.0"
ruby_add_rdepend ">=dev-ruby/rails-3.1.0"
ruby_add_rdepend ">=dev-ruby/cucumber-rails-0"
ruby_add_rdepend ">=dev-ruby/factory_girl-0"
ruby_add_rdepend ">=dev-ruby/fabrication-2.0"
ruby_add_rdepend ">=dev-ruby/machinist-2.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-ruby-0"

