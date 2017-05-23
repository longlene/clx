# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="OpenID strategy for OmniAuth"
HOMEPAGE="https://github.com/intridea/omniauth-openid"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.0"
ruby_add_rdepend ">=dev-ruby/rack-openid-1.3.1"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5"
ruby_add_rdepend ">=dev-ruby/rake-0.8"
ruby_add_rdepend ">=dev-ruby/rdiscount-1.6"
ruby_add_rdepend ">=dev-ruby/rspec-2.7"
ruby_add_rdepend ">=dev-ruby/simplecov-0.4"
ruby_add_rdepend ">=dev-ruby/webmock-1.7"
ruby_add_rdepend ">=dev-ruby/yard-0.7"

