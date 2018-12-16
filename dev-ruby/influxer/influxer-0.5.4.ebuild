# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="InfluxDB the Rails way"
HOMEPAGE="http://github.com/palkan/influxer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.0"
ruby_add_rdepend ">=dev-ruby/influxdb-0.3"
ruby_add_rdepend ">=dev-ruby/anyway_config-0.3.0"
ruby_add_rdepend ">=dev-ruby/timecop-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.3.8"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/activerecord-4.0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.21.0"

