# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Flexible authentication solution for Rails with Warden"
HOMEPAGE="https://github.com/plataformatec/devise"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/warden-1.2.3"
ruby_add_rdepend ">=dev-ruby/orm_adapter-0.1"
ruby_add_rdepend ">=dev-ruby/bcrypt-3.0"
ruby_add_rdepend ">=dev-ruby/railties-4.1.0"
ruby_add_rdepend ">=dev-ruby/responders-0"

