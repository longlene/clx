# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simplified command-line administration for Kafka brokers"
HOMEPAGE="https://github.com/airbnb/kafkat"

LICENSE="Apache-v2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/zk-1.9"
ruby_add_rdepend ">=dev-ruby/trollop-2.0"
ruby_add_rdepend ">=dev-ruby/highline-1.6"
ruby_add_rdepend ">=dev-ruby/retryable-1.3"
ruby_add_rdepend ">=dev-ruby/colored-1.2"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend "<dev-ruby/activesupport-2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.11.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.2.0"
ruby_add_rdepend ">=dev-ruby/rspec-collection_matchers-1.1.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.5.0"

