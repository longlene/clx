# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Database console for Ruby applications running on Rack with ActiveRecord and following the Rails config/database"
HOMEPAGE="http://github.com/pond/rackdb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.6"
ruby_add_rdepend ">=dev-ruby/activerecord-4"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.3"

