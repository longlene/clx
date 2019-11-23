# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Connect all iOS deployment tools into one streamlined workflow"
HOMEPAGE="https://fastlane.tools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/krausefx-shenzhen-0.14.7"
ruby_add_rdepend ">=dev-ruby/slack-notifier-1.3"
ruby_add_rdepend ">=dev-ruby/xcodeproj-0.20"
ruby_add_rdepend ">=dev-ruby/xcpretty-0.2.1"
ruby_add_rdepend ">=dev-ruby/terminal-notifier-1.6.2"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4.5"
ruby_add_rdepend ">=dev-ruby/plist-3.1.0"
ruby_add_rdepend ">=dev-ruby/addressable-2.3.8"
ruby_add_rdepend ">=dev-ruby/fastlane_core-0.36.1"
ruby_add_rdepend ">=dev-ruby/credentials_manager-0.14.0"
ruby_add_rdepend ">=dev-ruby/spaceship-0.19.3"
ruby_add_rdepend ">=dev-ruby/deliver-1.9.0"
ruby_add_rdepend ">=dev-ruby/snapshot-1.6.0"
ruby_add_rdepend ">=dev-ruby/frameit-2.4.1"
ruby_add_rdepend ">=dev-ruby/pem-1.1.1"
ruby_add_rdepend ">=dev-ruby/cert-1.2.8"
ruby_add_rdepend ">=dev-ruby/sigh-1.3.1"
ruby_add_rdepend ">=dev-ruby/produce-1.1.0"
ruby_add_rdepend ">=dev-ruby/gym-1.4.0"
ruby_add_rdepend ">=dev-ruby/pilot-1.2.1"
ruby_add_rdepend ">=dev-ruby/supply-0.3.0"
ruby_add_rdepend ">=dev-ruby/scan-0.4.2"
ruby_add_rdepend ">=dev-ruby/match-0.2.5"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.4"
ruby_add_rdepend ">=dev-ruby/webmock-1.19.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.35.1"
ruby_add_rdepend ">=dev-ruby/appium_lib-4.1.0"

