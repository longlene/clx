# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A real-time Redis monitoring tool written in Ruby"
HOMEPAGE="https://github.com/junegunn/redis-stat"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ansi256-0.2.5"
ruby_add_rdepend ">=dev-ruby/redis-3.0.2"
ruby_add_rdepend ">=dev-ruby/tabularize-0.2.9"
ruby_add_rdepend ">=dev-ruby/insensitive_hash-0.3.0"
ruby_add_rdepend ">=dev-ruby/parallelize-0.4.0"
ruby_add_rdepend ">=dev-ruby/si-0.1.4"
ruby_add_rdepend ">=dev-ruby/sinatra-1.3.3"
ruby_add_rdepend ">=dev-ruby/json-1.8.2"
ruby_add_rdepend ">=dev-ruby/lps-0.2.0"
ruby_add_rdepend ">=dev-ruby/elasticsearch-1.0.0"
ruby_add_rdepend ">=dev-ruby/thin-1.5.0"
ruby_add_rdepend ">=dev-ruby/daemons-1.1.9"

