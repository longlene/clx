# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library can be used as a module for fog or as standalone provider to use the Hadoop services in applications"
HOMEPAGE="http://github.com/fog/fog-hadoop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-core-0"
ruby_add_rdepend ">=dev-ruby/fog-json-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rbvmomi-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/rbovirt-0.0.24"
ruby_add_rdepend ">=dev-ruby/shindo-0.3.4"
ruby_add_rdepend ">=dev-ruby/fission-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-1.0.0"
