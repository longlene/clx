# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Redis Admin interface and monitor"
HOMEPAGE="https://github.com/steelThread/redmon"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.2.6"
ruby_add_rdepend ">=dev-ruby/hiredis-0.4.0"
ruby_add_rdepend ">=dev-ruby/redis-2.2.2"
ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/thin-1.5.1"
ruby_add_rdepend ">=dev-ruby/mixlib-cli-0"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-1.3.1"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.8.0"

