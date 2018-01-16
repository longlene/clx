# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A library to read/write files/spreadsheets in Google Drive/Docs"
HOMEPAGE="https://github.com/gimite/google-drive-ruby"

LICENSE="New BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.4"
ruby_add_rdepend ">=dev-ruby/oauth-0.3.6"
ruby_add_rdepend ">=dev-ruby/oauth2-0.5.0"
ruby_add_rdepend ">=dev-ruby/google-api-client-0.7.0"
ruby_add_rdepend ">=dev-ruby/test-unit-3.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.4.0"

