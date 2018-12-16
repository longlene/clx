# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
      Squeel unlocks the power of Arel in your Rails application with
      a handy block-based syntax"
HOMEPAGE="https://github.com/ernie/squeel"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/polyamorous-1.1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"
ruby_add_rdepend ">=dev-ruby/faker-0.9.5"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.3"
ruby_add_rdepend ">=dev-ruby/mysql-2.9.1"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3.16"
ruby_add_rdepend ">=dev-ruby/pg-0.17.1"
ruby_add_rdepend ">=dev-ruby/git_pretty_accept-0.4.0"
ruby_add_rdepend ">=dev-ruby/pry-0"

