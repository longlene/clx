# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="The CocoaPods-Core gem provides support to work with the models of CocoaPods"
HOMEPAGE="https://github.com/CocoaPods/CocoaPods"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.2.15"
ruby_add_rdepend ">=dev-ruby/fuzzy_match-2.0.4"
ruby_add_rdepend ">=dev-ruby/json_pure-1.8"
ruby_add_rdepend ">=dev-ruby/nap-0.5"

