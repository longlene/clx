# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Google API Ruby Client makes it trivial to discover and access supported APIs"
HOMEPAGE="https://github.com/google/google-api-ruby-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/signet-0.6"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/googleauth-0.3"
ruby_add_rdepend ">=dev-ruby/multi_json-1.10"
ruby_add_rdepend ">=dev-ruby/autoparse-0.3"
ruby_add_rdepend ">=dev-ruby/extlib-0.9"
ruby_add_rdepend ">=dev-ruby/launchy-2.4"
ruby_add_rdepend ">=dev-ruby/retriable-1.4"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/kramdown-1.5"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9.2"
ruby_add_rdepend ">=dev-ruby/coveralls-0.7.11"

