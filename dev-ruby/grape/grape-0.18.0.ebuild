# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby framework for rapid API development with great conventions"
HOMEPAGE="https://github.com/ruby-grape/grape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.3.0"
ruby_add_rdepend ">=dev-ruby/mustermann-grape-0.4.0"
ruby_add_rdepend ">=dev-ruby/rack-accept-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3.2"
ruby_add_rdepend ">=dev-ruby/multi_xml-0.5.2"
ruby_add_rdepend ">=dev-ruby/hashie-2.1.0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0.0"
ruby_add_rdepend ">=dev-ruby/builder-0"

