# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Transparent, extensible background processing for Ruby & PostgreSQL"
HOMEPAGE="https://github.com/tombenner/toro"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.15.2"
ruby_add_rdepend ">=dev-ruby/rails-3.0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/activerecord-postgres-hstore-0"
ruby_add_rdepend ">=dev-ruby/nested-hstore-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/jquery-datatables-rails-2.1.10.0.2"
ruby_add_rdepend ">=dev-ruby/rails-datatables-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"

