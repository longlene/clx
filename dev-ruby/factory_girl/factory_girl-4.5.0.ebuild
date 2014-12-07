# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="factory_girl provides a framework and DSL for defining and
                      using factories - less error-prone, more explicit, and
                      all-around easier to work with than fixtures"
HOMEPAGE="https://github.com/thoughtbot/factory_girl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.12.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3.15"
ruby_add_rdepend ">=dev-ruby/timecop-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/aruba-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.12.8"
ruby_add_rdepend ">=dev-ruby/bourne-0"
ruby_add_rdepend ">=dev-ruby/appraisal-1.0.0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/yard-0"

