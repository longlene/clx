# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby framework for rapid API development with great conventions."
HOMEPAGE="https://github.com/intridea/grape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend ">=dev-ruby/hashie-1.2.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3.2"
ruby_add_rdepend ">=dev-ruby/multi_xml-0.5.2"
ruby_add_rdepend ">=dev-ruby/rack-1.3.0"
ruby_add_rdepend ">=dev-ruby/rack-accept-0"
ruby_add_rdepend ">=dev-ruby/rack-mount-0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
