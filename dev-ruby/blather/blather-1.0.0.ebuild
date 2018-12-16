# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An XMPP DSL for Ruby written on top of EventMachine and Nokogiri"
HOMEPAGE="http://adhearsion.com/blather"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-2.3.11"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/girl_friday-0"
ruby_add_rdepend ">=dev-ruby/niceogiri-1.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.6"

