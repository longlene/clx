# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Capybara is an integration testing tool for rack based web applications"
HOMEPAGE="https://github.com/teamcapybara/capybara"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.3.3"
ruby_add_rdepend ">=dev-ruby/mini_mime-0.1.3"
ruby_add_rdepend ">=dev-ruby/rack-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.4"
ruby_add_rdepend ">=dev-ruby/xpath-2.0"
ruby_add_rdepend ">=dev-ruby/addressable-0"

