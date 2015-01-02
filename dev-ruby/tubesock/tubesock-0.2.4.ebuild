# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Websocket interface on Rack Hijack w/ Rails support"
HOMEPAGE="http://github.com/ngauthier/tubesock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.5.0"
ruby_add_rdepend ">=dev-ruby/websocket-1.1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-4.7.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"

