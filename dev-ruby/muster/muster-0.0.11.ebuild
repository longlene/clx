# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Muster is a gem that turns query strings of varying formats into data structures suitable for easier consumption in AR/DataMapper scopes and queries"
HOMEPAGE="https://github.com/claco/muster"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/rack-1.4"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.11.0"
ruby_add_rdepend ">=dev-ruby/redcarpet-2.1"
ruby_add_rdepend ">=dev-ruby/rubocop-0.33.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.2"

