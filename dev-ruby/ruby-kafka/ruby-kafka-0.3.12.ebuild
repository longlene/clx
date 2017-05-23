# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A client library for the Kafka distributed commit log"
HOMEPAGE="https://github.com/zendesk/ruby-kafka"

LICENSE="Apache License Version 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.9.5"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/dotenv-0"
ruby_add_rdepend ">=dev-ruby/docker-api-0"
ruby_add_rdepend ">=dev-ruby/rspec-benchmark-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/snappy-0"
ruby_add_rdepend ">=dev-ruby/colored-0"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0.2.2"
ruby_add_rdepend ">=dev-ruby/dogstatsd-ruby-0"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0"

