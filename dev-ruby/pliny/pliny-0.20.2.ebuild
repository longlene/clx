# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pliny is a set of base classes and helpers to help developers write excellent APIs in Sinatra"
HOMEPAGE="https://github.com/interagent/pliny"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.1"
ruby_add_rdepend ">=dev-ruby/multi_json-1.9"
ruby_add_rdepend ">=dev-ruby/prmd-0.11"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/http_accept-0.1"
ruby_add_rdepend ">=dev-ruby/sinatra-router-0.2"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/rake-0.8"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-1.4"
ruby_add_rdepend ">=dev-ruby/timecop-0.7"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pg-0.17"
ruby_add_rdepend ">=dev-ruby/rollbar-2.11"
ruby_add_rdepend ">=dev-ruby/sequel-4.9"

