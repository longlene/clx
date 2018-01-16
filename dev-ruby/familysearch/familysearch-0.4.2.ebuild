# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A gem for the FamilySearch Platform"
HOMEPAGE="https://github.com/jimmyz/familysearch-rb"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/faraday-0.8.4"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.5.0"
ruby_add_rdepend ">=dev-ruby/addressable-2.3.3"
ruby_add_rdepend ">=dev-ruby/familysearch-gedcomx-1.0.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/shoulda-3.3.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.2.3"
ruby_add_rdepend ">=dev-ruby/vcr-2.4.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.10.0"

