# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides helpers for accessing the LinkedIn API in Sinatra applications"
HOMEPAGE="https://github.com/bnadlerjr/sinatra-linkedin"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/contest-0.1.3"
ruby_add_rdepend ">=dev-ruby/mocha-0.10.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.1"
ruby_add_rdepend ">=dev-ruby/rdoc-3.6.1"
ruby_add_rdepend ">=dev-ruby/linkedin-0.4.4"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4.3"

