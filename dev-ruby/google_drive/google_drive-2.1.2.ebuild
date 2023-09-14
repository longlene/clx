# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A library to read/write files/spreadsheets in Google Drive/Docs"
HOMEPAGE="https://github.com/gimite/google-drive-ruby"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.3"
ruby_add_rdepend ">=dev-ruby/google-api-client-0.9.0"
ruby_add_rdepend ">=dev-ruby/googleauth-0.5.0"
ruby_add_rdepend ">=dev-ruby/test-unit-3.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.4.0"

