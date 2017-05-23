# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Zachary's Tool Kit contains a collection of reusable classes meant to simplify development of complex systems in Ruby, especially devops tooling"
HOMEPAGE="https://github.com/zpatten/ztk"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/net-ssh-0"
ruby_add_rdepend ">=dev-ruby/net-ssh-gateway-0"
ruby_add_rdepend ">=dev-ruby/net-sftp-0"
ruby_add_rdepend ">=dev-ruby/net-scp-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend "<dev-ruby/redcarpet-3.0.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/yarjuf-0"
ruby_add_rdepend ">=dev-ruby/simplecov-rcov-0"
ruby_add_rdepend ">=dev-ruby/travis-0"
ruby_add_rdepend ">=dev-ruby/typhoeus-0.6.7"
ruby_add_rdepend ">=dev-ruby/websocket-native-0"

