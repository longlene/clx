# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple, efficient background processing for Ruby"
HOMEPAGE="http://sidekiq.org"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.3"
ruby_add_rdepend ">=dev-ruby/connection_pool-2.2"
ruby_add_rdepend ">=dev-ruby/concurrent-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/rack-protection-1.5.0"
ruby_add_rdepend ">=dev-ruby/redis-namespace-1.5"
ruby_add_rdepend ">=dev-ruby/minitest-5.10"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rails-3.2.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.11"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.12"
ruby_add_rdepend ">=dev-ruby/percy-capybara-2.3"
ruby_add_rdepend ">=dev-ruby/timecop-0.8"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"

