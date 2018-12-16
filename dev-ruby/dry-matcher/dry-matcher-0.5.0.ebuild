# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Flexible, expressive pattern matching for Ruby"
HOMEPAGE="http://dry-rb.org/gems/dry-matcher"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/rake-10.4.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.10.0"
ruby_add_rdepend ">=dev-ruby/yard-0"

