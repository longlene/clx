# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Seamless Ruby on Rails websocket integration"
HOMEPAGE="http://websocket-rails.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/faye-websocket-0"
ruby_add_rdepend ">=dev-ruby/thin-0"
ruby_add_rdepend ">=dev-ruby/redis-0"
ruby_add_rdepend ">=dev-ruby/hiredis-0"
ruby_add_rdepend ">=dev-ruby/em-synchrony-0"
ruby_add_rdepend ">=dev-ruby/redis-objects-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"
ruby_add_rdepend ">=dev-ruby/rspec-matchers-matchers-0"

