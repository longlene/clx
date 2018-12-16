# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Karafka integration for Capistrano"
HOMEPAGE="https://github.com/karafka/capistrano-karafka"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/capistrano-3.9"
ruby_add_rdepend ">=dev-ruby/capistrano-bundler-0"
ruby_add_rdepend ">=dev-ruby/karafka-0.5"

