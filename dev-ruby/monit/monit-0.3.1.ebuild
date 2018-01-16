# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Retrieve server information from Monit"
HOMEPAGE="http://github.com/k33l0r/monit"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.9.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.11.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.2"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2.12"

