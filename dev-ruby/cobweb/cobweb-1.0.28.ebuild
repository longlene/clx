# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cobweb is a web crawler that can use resque to cluster crawls to quickly crawl extremely large sites which is much more performant than multi-threaded crawlers"
HOMEPAGE="http://github.com/stewartmckee/cobweb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/redis-namespace-1.3"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/slop-3.4"

