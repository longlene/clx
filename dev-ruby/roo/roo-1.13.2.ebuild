# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

inherit ruby-fakegem

DESCRIPTION="Roo can access the contents of various spreadsheet files"
HOMEPAGE="http://github.com/Empact/roo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rubyzip-0"
ruby_add_rdepend ">dev-ruby/spreadsheet-0.6.4"

