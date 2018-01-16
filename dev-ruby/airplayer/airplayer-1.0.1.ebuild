# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Command-line AirPlay video client for Apple TV"
HOMEPAGE="https://github.com/Tomohiro/airplayer"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-0"
ruby_add_rdepend ">=dev-ruby/mime-types-2.4.0"
ruby_add_rdepend ">=dev-ruby/airplay-1.0.2"
ruby_add_rdepend ">=dev-ruby/rack-1.5.0"
ruby_add_rdepend "=dev-ruby/http-0.5.0"
ruby_add_rdepend "=dev-ruby/reel-0.4.0"
ruby_add_rdepend "=dev-ruby/reel-rack-0.1.0"
ruby_add_rdepend "=dev-ruby/celluloid-0.15.2"
ruby_add_rdepend "=dev-ruby/celluloid-io-0.15.0"
ruby_add_rdepend "=dev-ruby/cuba-3.1.1"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/fakefs-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"

