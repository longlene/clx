# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Track changes to your models' data"
HOMEPAGE="https://github.com/airblade/paper_trail"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/rake-10.1.1"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5"
ruby_add_rdepend ">=dev-ruby/ffaker-1.15"
ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/sinatra-1.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.14"
ruby_add_rdepend ">=dev-ruby/generator_spec-0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.2"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3"
ruby_add_rdepend ">=dev-ruby/pg-0.17"

