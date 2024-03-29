# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Call placing and handling framework"
HOMEPAGE="https://github.com/ZestFinance/zestphone"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3.0"
ruby_add_rdepend ">=dev-ruby/state_machine-0"
ruby_add_rdepend ">=dev-ruby/kaminari-0"
ruby_add_rdepend "=dev-ruby/pusher-0.11.3"
ruby_add_rdepend ">=dev-ruby/ejs-0"
ruby_add_rdepend ">=dev-ruby/sass-0"

