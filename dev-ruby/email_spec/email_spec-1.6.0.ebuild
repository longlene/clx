# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Easily test email in RSpec, Cucumber, and MiniTest"
HOMEPAGE="http://github.com/bmabey/email-spec/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/launchy-2.1"
ruby_add_rdepend ">=dev-ruby/mail-2.2"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/cucumber-rails-0"
ruby_add_rdepend ">=dev-ruby/cucumber-sinatra-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.14.0"
ruby_add_rdepend ">=dev-ruby/delayed_job-2.0"
ruby_add_rdepend ">=dev-ruby/pony-0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rails-3.0.7"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"

