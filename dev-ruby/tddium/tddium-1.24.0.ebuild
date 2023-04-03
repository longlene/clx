# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Solano CI runs your test suite simply and quickly in our managed
cloud environment"
HOMEPAGE="https://github.com/solanolabs/tddium.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/highline-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/github_api-0"
ruby_add_rdepend ">=dev-ruby/tddium_client-0.4.2"
ruby_add_rdepend ">=dev-ruby/nayutaya-msgpack-pure-0.0.2"
ruby_add_rdepend ">=dev-ruby/aruba-0.4.6"
ruby_add_rdepend ">=dev-ruby/rdiscount-1.6.8"
ruby_add_rdepend ">=dev-ruby/pickle-0"
ruby_add_rdepend ">=dev-ruby/mimic-0"
ruby_add_rdepend ">=dev-ruby/daemons-0"
ruby_add_rdepend ">=dev-ruby/httparty-0.9.0"
ruby_add_rdepend ">=dev-ruby/antilles-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/fakefs-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

