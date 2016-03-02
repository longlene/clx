# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Object oriented authorization for Rails applications"
HOMEPAGE="https://github.com/elabs/pundit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-2.0.0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"

