# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides an embedded LDAP server for BDD"
HOMEPAGE="http://github.com/NUBIC/ladle"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/open4-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/yard-0.6.1"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"
ruby_add_rdepend ">=dev-ruby/net-ldap-0.3.1"
ruby_add_rdepend ">=dev-ruby/ci_reporter-1.6"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

