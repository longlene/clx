# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Feeder gives you a mountable engine that provides a route to a feed page in your
Ruby on Rails application"
HOMEPAGE="http://github.com/hyperoslo/feeder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0"
ruby_add_rdepend ">=dev-ruby/rails-observers-0"
ruby_add_rdepend ">=dev-ruby/kaminari-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/pry-rails-0"
ruby_add_rdepend ">=dev-ruby/hirb-unicode-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"
ruby_add_rdepend ">=dev-ruby/factory_girl_rails-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"

