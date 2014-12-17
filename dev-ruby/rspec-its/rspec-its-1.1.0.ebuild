# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RSpec extension gem for attribute matching"
HOMEPAGE="https://github.com/rspec/rspec-its"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-core-3.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-3.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3.8"
ruby_add_rdepend ">=dev-ruby/aruba-0.5"

