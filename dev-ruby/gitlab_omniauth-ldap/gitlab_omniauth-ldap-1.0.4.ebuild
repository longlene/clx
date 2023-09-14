# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A LDAP strategy for OmniAuth"
HOMEPAGE="https://github.com/gitlabhq/omniauth-ldap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/net-ldap-0.3.1"
ruby_add_rdepend ">=dev-ruby/omniauth-1.0"
ruby_add_rdepend ">=dev-ruby/pyu-ruby-sasl-0.0.3.1"
ruby_add_rdepend ">=dev-ruby/rubyntlm-0.1.1"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
