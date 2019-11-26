# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="CocoaPods manages library dependencies for your Xcode project"
HOMEPAGE="https://github.com/CocoaPods/CocoaPods"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.2.15"
ruby_add_rdepend ">=dev-ruby/claide-0.6.1"
ruby_add_rdepend ">=dev-ruby/cocoapods-core-0.33.1"
ruby_add_rdepend ">=dev-ruby/cocoapods-downloader-0.6.1"
ruby_add_rdepend ">=dev-ruby/cocoapods-plugins-0.2.0"
ruby_add_rdepend ">=dev-ruby/cocoapods-trunk-0.1.1"
ruby_add_rdepend ">=dev-ruby/cocoapods-try-0.3.0"
ruby_add_rdepend ">=dev-ruby/colored-1.2"
ruby_add_rdepend ">=dev-ruby/escape-0.0.4"
ruby_add_rdepend ">=dev-ruby/json_pure-1.8"
ruby_add_rdepend ">=dev-ruby/nap-0.7"
ruby_add_rdepend ">=dev-ruby/open4-1.3"
ruby_add_rdepend ">=dev-ruby/xcodeproj-0.17.0"

