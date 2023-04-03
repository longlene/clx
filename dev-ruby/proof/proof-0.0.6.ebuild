# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/Sans/proof"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/output-0"
ruby_add_rdepend ">=dev-ruby/initializer-0"
ruby_add_rdepend ">=dev-ruby/setter-0"
ruby_add_rdepend ">=dev-ruby/single-0"
ruby_add_rdepend ">=dev-ruby/extension-0"

