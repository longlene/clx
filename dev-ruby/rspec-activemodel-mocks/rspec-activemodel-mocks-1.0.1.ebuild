# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RSpec test doubles for ActiveModel and ActiveRecord"
HOMEPAGE="http://github.com/thomas-holmes/rspec-activemodel-mocks"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-2.99"
ruby_add_rdepend ">=dev-ruby/rake-10.0.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3.5"
ruby_add_rdepend ">=dev-ruby/aruba-0.4.11"
ruby_add_rdepend ">=dev-ruby/ZenTest-4.9.5"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0"

