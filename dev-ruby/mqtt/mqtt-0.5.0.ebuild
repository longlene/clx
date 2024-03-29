# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pure Ruby gem that implements the MQTT protocol, a lightweight protocol for publish/subscribe messaging"
HOMEPAGE="http://github.com/njh/ruby-mqtt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.11.2"
ruby_add_rdepend ">=dev-ruby/rake-10.2.2"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"
ruby_add_rdepend ">=dev-ruby/rspec-3.5.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9.2"

