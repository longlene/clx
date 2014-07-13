# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="jruby"

inherit ruby-fakegem

DESCRIPTION="Ruboto (JRuby on Android) is a platform for developing full stand-alone apps for Android using the Ruby language and libraries"
HOMEPAGE="http://ruboto.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/main-5.2"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rubyzip-1.0"

