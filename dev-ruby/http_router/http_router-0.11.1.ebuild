# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library allows you to recognize and build URLs in a Rack application"
HOMEPAGE="http://github.com/joshbuddy/http_router"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RDEPEND=">=www-servers/thin-1.2.8"

ruby_add_rdepend ">=dev-ruby/rack-1.0.0"
ruby_add_rdepend ">=dev-ruby/url_mount-0.2.1"
ruby_add_rdepend ">=dev-ruby/minitest-2.0.0"
ruby_add_rdepend ">=dev-ruby/code_stats-0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/rbench-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/phocus-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
#ruby_add_rdepend "=dev-ruby/thin-1.2.8"

