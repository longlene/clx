# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple WSDL parser"
HOMEPAGE="https://github.com/savonrb/wasabi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httpi-2.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"

