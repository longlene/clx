# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Now you can use the super fast COPY for import/export data directly from your AR models"
HOMEPAGE="http://github.com/diogob/postgres-copy"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pg-0.17"
ruby_add_rdepend ">=dev-ruby/activerecord-4.0"
ruby_add_rdepend ">=dev-ruby/responders-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.12"
ruby_add_rdepend ">=dev-ruby/rake-11.2.2"

