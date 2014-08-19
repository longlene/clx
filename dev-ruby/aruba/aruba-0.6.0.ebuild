# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="CLI Steps for Cucumber, hand-crafted for you in Aruba"
HOMEPAGE="http://github.com/cucumber/aruba"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cucumber-1.1.1"
ruby_add_rdepend ">=dev-ruby/childprocess-0.3.6"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-2.7.0"
ruby_add_rdepend ">=dev-ruby/bcat-0.6.1"
ruby_add_rdepend ">=dev-ruby/kramdown-0.14"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/fuubar-1.1.1"
ruby_add_rdepend ">=dev-ruby/cucumber-pro-0.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
