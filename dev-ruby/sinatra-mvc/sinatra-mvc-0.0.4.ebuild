# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A custom MVC stack that tries to keep the lightweight Sinatra feeling, while adding structure to an already awesome workflow"
HOMEPAGE="http://sinatra-mvc.org/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/sinatra-1.1"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/sinatra-r18n-0"
ruby_add_rdepend ">=dev-ruby/rack-flash-0"
ruby_add_rdepend ">=dev-ruby/sinatra-redirect-with-flash-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/dm-core-0"
ruby_add_rdepend ">=dev-ruby/dm-types-0"
ruby_add_rdepend ">=dev-ruby/dm-validations-0"
ruby_add_rdepend ">=dev-ruby/memcache-client-0"

