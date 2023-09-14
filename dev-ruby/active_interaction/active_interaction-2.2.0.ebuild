# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    ActiveInteraction manages application-specific business logic"
HOMEPAGE="http://devblog.orgsync.com/active_interaction/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-3.2"
ruby_add_rdepend ">=dev-ruby/actionpack-3.2"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-2.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/coveralls-0.8"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.6"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-1.2"
ruby_add_rdepend ">=dev-ruby/kramdown-1.9"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/rubocop-0.35"
ruby_add_rdepend ">=dev-ruby/yard-0.8"

