# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="PostgreSQL asynchronous EventMachine client, based on pg interface (PG::Connection)"
HOMEPAGE="http://github.com/royaltm/ruby-em-pg-client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pg-0.17.0"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/em-synchrony-1.0.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0.7.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8.2"

