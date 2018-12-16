# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ires is image resizer gem"
HOMEPAGE="https://github.com/endotakuya/ires"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.1.8"
ruby_add_rdepend ">=dev-ruby/rails-5.0.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"

