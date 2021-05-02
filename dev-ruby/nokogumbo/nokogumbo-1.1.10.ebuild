# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Nokogumbo allows a Ruby program to invoke the Gumbo HTML5 parser and access the result as a Nokogiri parsed document"
HOMEPAGE="https://github.com/rubys/nokogumbo/#readme"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"

