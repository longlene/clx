# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sync turns your Rails partials realtime with automatic updates through Faye"
HOMEPAGE="http://github.com/chrismccord/sync"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/em-http-request-0"
ruby_add_rdepend ">=dev-ruby/faye-0"
ruby_add_rdepend ">=dev-ruby/thin-0"
ruby_add_rdepend ">=dev-ruby/pusher-0.11.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rails-3.2.13"
ruby_add_rdepend ">=dev-ruby/cache_digests-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.3"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend "<dev-ruby/minitest-5.0.0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0"

