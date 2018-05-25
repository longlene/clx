# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Framework used to simplify Apache Kafka based Ruby applications development"
HOMEPAGE="https://github.com/karafka/karafka"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-5.0"
ruby_add_rdepend ">=dev-ruby/dry-configurable-0.7"
ruby_add_rdepend ">=dev-ruby/dry-validation-0.11"
ruby_add_rdepend ">=dev-ruby/envlogic-1.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.12"
ruby_add_rdepend ">=dev-ruby/rake-11.3"
ruby_add_rdepend ">=dev-ruby/require_all-1.4"
ruby_add_rdepend ">=dev-ruby/ruby-kafka-0.5"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/waterdrop-1.0.1"

