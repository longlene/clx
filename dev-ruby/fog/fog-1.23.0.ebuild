# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Ruby cloud services library"
HOMEPAGE="http://github.com/fog/fog"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-brightbox-0"
ruby_add_rdepend ">=dev-ruby/fog-core-1.23"
ruby_add_rdepend ">=dev-ruby/fog-json-0"
ruby_add_rdepend ">=dev-ruby/fog-softlayer-0"
ruby_add_rdepend ">=dev-ruby/ipaddress-0.5"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.11"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
