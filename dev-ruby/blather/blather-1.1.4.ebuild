# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An XMPP DSL for Ruby written on top of EventMachine and Nokogiri"
HOMEPAGE="http://adhearsion.com/blather"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"
ruby_add_rdepend ">=dev-ruby/niceogiri-1.0"
ruby_add_rdepend ">=dev-ruby/activesupport-2.3.11"
ruby_add_rdepend ">=dev-ruby/girl_friday-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.7"
ruby_add_rdepend ">=dev-ruby/mocha-0.9"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/yard-0.6"
ruby_add_rdepend ">=dev-ruby/bluecloth-0"
ruby_add_rdepend ">=dev-ruby/countdownlatch-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9"

