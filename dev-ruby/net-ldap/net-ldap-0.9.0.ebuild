# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Net::LDAP for Ruby (also called net-ldap) implements client access for the
Lightweight Directory Access Protocol (LDAP), an IETF standard protocol for
accessing distributed directory services"
HOMEPAGE="http://github.com/ruby-ldap/ruby-net-ldap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hoe-git-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-gemspec-1.0"
ruby_add_rdepend ">=dev-ruby/flexmock-1.3"
ruby_add_rdepend ">=dev-ruby/hoe-2.9"

