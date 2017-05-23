# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="CLI and Ruby client library for Travis CI"
HOMEPAGE="https://github.com/travis-ci/travis.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9"
ruby_add_rdepend ">=dev-ruby/highline-1.6"
ruby_add_rdepend ">=dev-ruby/backports-0"
ruby_add_rdepend ">=dev-ruby/gh-0.13"
ruby_add_rdepend ">=dev-ruby/launchy-2.1"
ruby_add_rdepend ">=dev-ruby/typhoeus-0.6"
ruby_add_rdepend ">=dev-ruby/pusher-client-0.4"
ruby_add_rdepend ">=dev-ruby/rspec-2.12"
ruby_add_rdepend ">=dev-ruby/sinatra-1.3"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"

