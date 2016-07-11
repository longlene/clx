# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ohai profiles your system and emits JSON"
HOMEPAGE="https://docs.chef.io/ohai.html"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/systemu-2.6.4"
ruby_add_rdepend ">=dev-ruby/ffi-yajl-2.2"
ruby_add_rdepend ">=dev-ruby/mixlib-cli-0"
ruby_add_rdepend ">=dev-ruby/mixlib-config-2.0"
ruby_add_rdepend ">=dev-ruby/mixlib-log-0"
ruby_add_rdepend ">=dev-ruby/mixlib-shellout-2.0"
ruby_add_rdepend ">=dev-ruby/plist-3.1"
ruby_add_rdepend ">=dev-ruby/ipaddress-0"
ruby_add_rdepend ">=dev-ruby/wmi-lite-1.0"
ruby_add_rdepend ">=dev-ruby/ffi-1.9"
ruby_add_rdepend ">=dev-ruby/chef-config-12.5.0"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/rspec-core-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-collection_matchers-1.0"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0"
ruby_add_rdepend ">=dev-ruby/github_changelog_generator-1.11.3"

