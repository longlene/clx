# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="DCell is an distributed object framework based on Celluloid built on 0MQ and Zookeeper"
HOMEPAGE="http://github.com/celluloid/dcell"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.16.0"
ruby_add_rdepend ">=dev-ruby/celluloid-zmq-0.16.0"
ruby_add_rdepend ">=dev-ruby/reel-0.4.0"
ruby_add_rdepend ">=dev-ruby/http-0.5.0"
ruby_add_rdepend ">=dev-ruby/celluloid-redis-0"
ruby_add_rdepend ">=dev-ruby/redis-namespace-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"

