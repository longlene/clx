# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Map Redis types directly to Ruby objects"
HOMEPAGE="http://github.com/nateware/redis-objects"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.0.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bacon-0"
ruby_add_rdepend ">=dev-ruby/connection_pool-0"
ruby_add_rdepend ">=dev-ruby/redis-namespace-0"
ruby_add_rdepend ">=dev-ruby/activerecord-4.2"

