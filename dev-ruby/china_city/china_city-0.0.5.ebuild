# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="a gem to help you select chinese area like province, city and district"
HOMEPAGE="https://github.com/saberma/china_city"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-3"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.14"
ruby_add_rdepend ">=dev-ruby/coffee-rails-4.1"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.8"
ruby_add_rdepend ">=dev-ruby/GB2260-0"
ruby_add_rdepend ">=dev-ruby/httparty-0"
ruby_add_rdepend ">=dev-ruby/json-0"

