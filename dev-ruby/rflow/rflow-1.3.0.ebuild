# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby flow-based programming framework that utilizes ZeroMQ for component connections and Avro for serialization"
HOMEPAGE="https://github.com/redjack/rflow"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/uuidtools-2.1"
ruby_add_rdepend ">=dev-ruby/log4r-1.1"
ruby_add_rdepend ">=dev-ruby/sys-filesystem-1.1"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/activerecord-4.0"
ruby_add_rdepend ">=dev-ruby/avro-1.8"
ruby_add_rdepend ">=dev-ruby/em-zeromq-0.5"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-collection_matchers-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/yard-0.9"

