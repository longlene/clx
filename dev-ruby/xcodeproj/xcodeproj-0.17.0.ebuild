# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="Xcodeproj lets you create and modify Xcode projects from Ruby"
HOMEPAGE="https://github.com/cocoapods/xcodeproj"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/colored-1.2"

