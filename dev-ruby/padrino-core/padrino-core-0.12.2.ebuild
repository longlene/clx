# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Padrino core gem required for use of this framework"
HOMEPAGE="http://www.padrinorb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.1"
ruby_add_rdepend ">=dev-ruby/http_router-0.11.0"
ruby_add_rdepend "=dev-ruby/padrino-support-0.12.2"
ruby_add_rdepend ">=dev-ruby/rack-protection-1.5.0"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4.2"
ruby_add_rdepend ">=dev-ruby/thor-0.18.0"

