# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RSpec matchers for Resque"
HOMEPAGE="http://github.com/leshill/resque_spec"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/resque-1.19.0"
ruby_add_rdepend ">=dev-ruby/rspec-core-3.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-3.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.0.0"
ruby_add_rdepend ">=dev-ruby/resque-scheduler-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"

