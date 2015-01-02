# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=omniauth-contrib.gemspec

inherit ruby-fakegem

DESCRIPTION="A Google OAuth2 strategy for OmniAuth 1"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">dev-ruby/omniauth-1.0"
ruby_add_rdepend ">=dev-ruby/omniauth-oauth2-1.1"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' omniauth-contrib.gemspec || die "sed failed"
}
