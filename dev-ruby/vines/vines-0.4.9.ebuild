# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Vines is an XMPP chat server that supports thousands of simultaneous connections, using EventMachine and Nokogiri"
HOMEPAGE="http://www.getvines.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-3.1"
ruby_add_rdepend ">=dev-ruby/em-hiredis-0.1.1"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.3"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0.5.3"
ruby_add_rdepend ">=dev-ruby/net-ldap-0.3.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.10"
ruby_add_rdepend ">=dev-ruby/minitest-5.3"
ruby_add_rdepend ">=dev-ruby/rake-10.3"

