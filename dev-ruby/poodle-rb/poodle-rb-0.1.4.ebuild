# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Poodle is a started kit for creating Rails Application"
HOMEPAGE="http://kpvarma.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/kaminari-0.16.2"
ruby_add_rdepend ">=dev-ruby/handy-css-rails-0.0"
ruby_add_rdepend ">=dev-ruby/bootstrap-kaminari-views-0.0.5"
ruby_add_rdepend ">=dev-ruby/bootstrap-datepicker-rails-1.3.1.1"
ruby_add_rdepend ">=dev-ruby/jquery-validation-rails-1.12"
ruby_add_rdepend ">=dev-ruby/rails-4.1"
ruby_add_rdepend ">=dev-ruby/pry-0.10.1"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.10"
ruby_add_rdepend ">=dev-ruby/carrierwave-0.10.0"
ruby_add_rdepend ">=dev-ruby/rmagick-2.13.3"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.2.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.4.4"
ruby_add_rdepend ">=dev-ruby/factory_girl_rails-4.5.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.4.0"

