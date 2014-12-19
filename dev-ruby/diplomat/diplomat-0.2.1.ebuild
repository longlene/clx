# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Diplomat is a simple wrapper for Consul"
HOMEPAGE="https://github.com/johnhamelink/diplomat"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/pry-0.9"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/fakes-rspec-1.0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.3.0"
ruby_add_rdepend ">=dev-ruby/fivemat-0"
ruby_add_rdepend ">=dev-ruby/gem-release-0.7"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"

