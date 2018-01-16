# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Async/sync inter sevrer communication tool, based on RabbitMQ and Celluloid"
HOMEPAGE="https://github.com/konalegi/asynk"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.17"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.17"
ruby_add_rdepend ">=dev-ruby/connection_pool-2.2"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/json-1.0"
ruby_add_rdepend ">=dev-ruby/bunny-2.3"
ruby_add_rdepend ">=dev-ruby/minitest-5.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rails-4"

