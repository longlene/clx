# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A static site generator"
HOMEPAGE="http://middlemanapp.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.1"
ruby_add_rdepend ">=dev-ruby/rack-1.4.5"
ruby_add_rdepend ">=dev-ruby/tilt-1.4.1"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/hooks-0.3"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.2"
ruby_add_rdepend ">=dev-ruby/thor-0.15.2"
ruby_add_rdepend ">=dev-ruby/activesupport-4.1.0"
ruby_add_rdepend ">=dev-ruby/padrino-helpers-0.12.3"
ruby_add_rdepend ">=dev-ruby/listen-2.7.9"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.9"

