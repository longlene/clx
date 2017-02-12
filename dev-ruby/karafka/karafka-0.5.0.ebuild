# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" Microframework used to simplify Kafka based Ruby applications "
HOMEPAGE="https://github.com/karafka/karafka"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.2"
ruby_add_rdepend "=dev-ruby/ruby-kafka-0.3.15"
ruby_add_rdepend ">=dev-ruby/sidekiq-4.2"
ruby_add_rdepend ">=dev-ruby/worker-glass-0.2"
ruby_add_rdepend ">=dev-ruby/celluloid-0.17"
ruby_add_rdepend ">=dev-ruby/envlogic-1.0"
ruby_add_rdepend ">=dev-ruby/waterdrop-0.3"
ruby_add_rdepend ">=dev-ruby/rake-11.3"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/activesupport-5.0"
ruby_add_rdepend ">=dev-ruby/dry-configurable-0.1.7"

