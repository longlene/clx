# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" Fast background processing framework for Ruby and RabbitMQ "
HOMEPAGE="http://sneakers.io"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/serverengine-1.5.11"
ruby_add_rdepend ">=dev-ruby/bunny-2.6"
ruby_add_rdepend ">=dev-ruby/thread-0.1.7"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/rabbitmq_http_api_client-0"
ruby_add_rdepend ">=dev-ruby/redis-0"
ruby_add_rdepend ">=dev-ruby/rr-0"
ruby_add_rdepend "=dev-ruby/unparser-0.2.2"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0"
ruby_add_rdepend ">=dev-ruby/guard-minitest-0"
ruby_add_rdepend ">=dev-ruby/metric_fu-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/simplecov-rcov-text-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/guard-0"

