# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Basic webservice hooks for the OpeNER toolchain"
HOMEPAGE=""

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.4.3"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/opener-callback-handler-1.0"
ruby_add_rdepend ">=dev-ruby/httpclient-2.0"
ruby_add_rdepend ">=dev-ruby/opener-core-2.3"
ruby_add_rdepend ">=www-servers/puma-0"
ruby_add_rdepend ">=dev-ruby/slop-3.0"
ruby_add_rdepend ">=dev-ruby/newrelic_rpm-0"
ruby_add_rdepend ">=dev-ruby/rollbar-1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"

