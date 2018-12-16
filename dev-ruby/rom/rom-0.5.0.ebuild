# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Persistence and mapping toolkit for Ruby"
HOMEPAGE="http://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/transproc-0.1"
ruby_add_rdepend ">=dev-ruby/equalizer-0.0"
ruby_add_rdepend ">=dev-ruby/concord-0.1"
ruby_add_rdepend ">=dev-ruby/charlatan-0.1"
ruby_add_rdepend ">=dev-ruby/inflecto-0.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rspec-core-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-3.1"

