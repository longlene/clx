# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Download, pull out of a ZIP/TAR/GZ/BZ2 archive, parse, correct, and import XLS, ODS, XML, CSV, HTML, etc"
HOMEPAGE="https://github.com/seamusabshere/data_miner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">dev-ruby/activerecord-3"
ruby_add_rdepend ">dev-ruby/activesupport-3"
ruby_add_rdepend ">=dev-ruby/errata-1.0.1"
ruby_add_rdepend ">=dev-ruby/remote_table-2.0.2"
ruby_add_rdepend ">=dev-ruby/upsert-0.3.1"
ruby_add_rdepend ">=dev-ruby/posix-spawn-0"
ruby_add_rdepend ">=dev-ruby/unix_utils-0"
ruby_add_rdepend ">=dev-ruby/roo-1.10.3"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/active_record_inline_schema-0"
ruby_add_rdepend ">=dev-ruby/fuzzy_match-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/pg-0"

