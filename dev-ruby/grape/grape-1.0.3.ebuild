# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby framework for rapid API development with great conventions"
HOMEPAGE="https://github.com/ruby-grape/grape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend ">=dev-ruby/mustermann-grape-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-1.3.0"
ruby_add_rdepend ">=dev-ruby/rack-accept-0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0.0"

